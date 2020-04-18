<?php

declare(strict_types = 1);

namespace App\Presenters;

use App\Model;

final class NabidkaPresenter extends BasePresenter {

    private $nabidkaManager;

    public function _construct(Model\NabidkaManager $nabidkaManager) {
        $this->nabidkaManager = $nabidkaManager;
    }

    public function renderList(): void {
        
    }

    public function renderDetail(): void {
        
    }

    public function actionInsert(): void {
        
    }

    public function actionUpdate(): void {
        
    }

    public function actionDelete(): void {
        $this->redirect('list');
    }

}
