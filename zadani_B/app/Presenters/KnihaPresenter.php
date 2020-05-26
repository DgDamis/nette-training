<?php

declare(strict_types=1);

namespace App\Presenters;

use App\Model;
use Nette\Application\UI\Form;
use Nette\Application\UI;
use Tracy\Debugger;

final class KnihaPresenter extends BasePresenter {

    private $knihaManager;

    public function __construct(Model\KnihaManager $knihaManager) {
        $this->knihaManager = $knihaManager;
    }

    public function renderDefault(): void {
        $this->template->anyVariable = 'any value';
    }

    public function renderList($order = 'title'): void {
        $this->template->knihaList = $this->knihaManager->getAll($order);
    }

    public function renderDetail($id): void {
        $this->template->kniha = $this->knihaManager->getById($id);
    }

    public function actionInsert($values): void {
    }

    public function actionUpdate($id, $values): void {
        $kniha = $this->knihaManager->getById($id);
	if (!$kniha) {
		$this->error('Příspěvek nebyl nalezen');
	}
	$this['knihaForm']->setDefaults($kniha->toArray());
    }

    public function actionDelete($id): void {
        $this->knihaManager->delete($id);
        $this->redirect('list');
    }

    protected function createComponentKnihaForm(): UI\Form {
        $form = new UI\Form;
        $form->addText('title', 'Název díla:')
                ->setRequired();
        $form->addText('author', 'Autor:')
                ->setRequired()
                ->addRule(Form::MAX_LENGTH, 'Maximální délka jména autora je 50 znaků.', 50);
        $form->addText('anotation', 'Stručná charakteristika díla:');
        $form->addInteger('year', 'Rok vzniku:')
                ->addRule(Form::RANGE, 'Věk musí být celé čtyřmístné číslo.', [0, 9999]);
        $druh = [
	'drama' => 'drama',
	'poezie' => 'poezie',
            'próza' => 'próza',
        ];
        $form->addRadioList('category', 'Literární druh:', $druh)
                ->setDefaultValue('próza');
        $form->addSelect('STARS', 'Hodnocení', [
            '5' => '*****',
            '4' => '****',
            '3' => '***',
            '2' => '**',
            '1' => '*',
        ]);
        $form->addSubmit('login', 'Potvrdit');
        $form->onSuccess[] = [$this, 'knihaFormSucceeded'];
        return $form;
    }

    // volá se po úspěšném odeslání formuláře
    public function knihaFormSucceeded(UI\Form $form, $values): void {
        // ...
        $postId = $this->getParameter('id');

	if ($postId) {
		$post = $this->knihaManager->getById($postId);
                $this->knihaManager->update($postId, $values);
                $this->flashMessage('Kniha byla úspěšně editována', 'success');
	} else {
		$post = $this->knihaManager->insert($values);
                $this->flashMessage('Kniha úspěšně přidána.');
	}
        $this->redirect('Kniha:list');
    }

}
