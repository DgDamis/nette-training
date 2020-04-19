<?php

declare(strict_types = 1);

namespace App\Presenters;

use App\Model;
use Nette\Application\UI;
use Tracy\Debugger;

final class NabidkaPresenter extends BasePresenter {

    private $nabidkaManager;

    public function __construct(Model\NabidkaManager $nabidkaManager) {
        $this->nabidkaManager = $nabidkaManager;
    }

    public function renderList($order = 'datum ASC'): void {
        Debugger:bdump('Proměnná order: ', $order);
        $this->template->nabidkaList = $this->nabidkaManager->getAll($order);
    }

    public function renderDetail($id): void {
        Debugger:bdump('Proměnná id: ', $id);
        $this->template->nabidka = $this->nabidkaManager->getById($id);
    }

    public function actionInsert(): void {
        //Debugger:log('Vložen nový záznam');
        
        
    }

    public function actionUpdate($id): void {
        //Debugger:log('Aktualizován záznam'.$id);
        $data = $this->nabidkaManager->getById($id)->toArray();
        /* Převede datum z formátu DateTime na datum ve tvaru rok-měsíc-den */
        $data['datum'] = $data['datum']->format('Y-m-d');
        Debugger::barDump($data);
        /* Nastaví výchozí hodnoty ve formuláři podle předaných dat */
        $this['nabidkaForm']->setDefaults($data);

    }

    public function actionDelete($id): void {
        //Debugger:log('Odstraněn záznam'.$id);
        $nabidkaId = $this->getParameter('id');
        $feedback = $this->nabidkaManager->delete($nabidkaId);
        if ($feedback) {
            /* zobrazíme "úspěšnou" zprávu na zeleném pozadí... */
            $this->flashMessage('Nabídka byla úspěšně smazána', 'success');
        } else {
            /* ...jinak se zobrazí chybová zpráva na červeném pozadí */
            $this->flashMessage('Došlo k nějaké chybě při mazání nabídky z databáze', 'danger');
        }
        $this->redirect('list');
    }

    public function renderDefault(): void {
        $this->redirect('list');
    }
    
    protected function createComponentNabidkaForm(): UI\Form {
        $form = new UI\Form;
        $form->addText('destinace', 'Název destinace:')
                /* Pravidlo je definováno pomocí regulárního výrazu */
                ->addRule(UI\Form::PATTERN, 'Musí obsahovat aspoň 5 znaků', '.{5,}')
                /* Údaj je povinný */
                ->setRequired(true);
        
        $form->addTextArea('popis', 'Stručný popis:')
                /* Vložení atributu do formulářového prvku */
                ->setHtmlAttribute('rows', '3')
                ->setRequired(true);

        
        $form->addInteger('cena', 'Cena: [Kč]')

                ->setRequired(true);

        $form->addText('datum', 'Den odjezdu:')
                /* Nastavení typu vstupního pole */
                ->setHtmlType('date')
                ->setRequired(true);

        $form->addInteger('delka', 'Počet nocí:')
                ->addRule(UI\Form::RANGE, 'Počet nocí musí být od 0 do 120', [0, 120])
                ->setRequired(true);

        
       $doprava = [
            'letadlo' => 'letadlo',
            'autobus' => 'autobus',
            'kombinovaná' => 'kombinovaná',
            'auto' => 'auto'
        ];

        $form->addSelect('doprava', 'Způsob dopravy:', $doprava);

        $form->addSubmit('submit', 'Potvrdit');
        
        $form->onSuccess[] = [$this, 'nabidkaFormSucceeded'];
        return $form;

    }
    
    public function nabidkaFormSucceeded(UI\Form $form, $values): void {
        Debugger::barDump($values);
        $nabidkaId = $this->getParameter('id');
        Debugger::barDump($nabidkaId);
        if ($nabidkaId) {
            /* předpokládáme akci update a použijeme připravenou metodu update, která je součástí AkceManager...  */
            $nabidka = $this->nabidkaManager->update($nabidkaId, $values);
        } else {
            /* ...v opačném případě hodláme vložit nový záznam metodou insert */
            $nabidka = $this->nabidkaManager->insert($values);
        }
        if ($nabidka) {
            /* zobrazíme "úspěšnou" zprávu na zeleném pozadí... */
            $this->flashMessage('Nabídka byla úspěšně uložena', 'success');
        } else {
            /* ...jinak se zobrazí chybová zpráva na červeném pozadí */
            $this->flashMessage('Došlo k nějaké chybě při ukládání do databáze', 'danger');
        }


        $this->flashMessage('Formulář byl odeslán','success');
        $this->redirect('Nabidka:list');
    }


}
