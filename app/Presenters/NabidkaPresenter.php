<?php

declare(strict_types = 1);

namespace App\Presenters;

use App\Model;
use Tracy\Debugger;

final class NabidkaPresenter extends BasePresenter {

    private $nabidkaManager;

    public function _construct(Model\NabidkaManager $nabidkaManager) {
        $this->nabidkaManager = $nabidkaManager;
    }

    public function renderList($order = 'datum DESC'): void {
        Debugger:bdump('Proměnná order: ', $order);
    }

    public function renderDetail($id): void {
        Debugger:bdump('Proměnná id: ', $id);
    }

    public function actionInsert(): void {
        Debugger:log('Vložen nový záznam');
        
    }

    public function actionUpdate($id): void {
        Debugger:log('Aktualizován záznam'.$id);
    }

    public function actionDelete($id): void {
        Debugger:log('Odstraněn záznam'.$id);
        $this->redirect('list');
    }

    public function renderDefault(): void {
        $this->redirect('list');
    }

}
