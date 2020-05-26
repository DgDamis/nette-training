<?php

declare(strict_types=1);

namespace App\Presenters;
use App\Model;


final class AkcePresenter extends BasePresenter
{
        private $akceManager;
        
        public function __construct(Model\AkceManager $akceManager)
	{
		$this->akceManager = $akceManager;
	}
        
	public function renderList($order = 'nazev ASC'): void
	{
		$this->template->seznamAkci = $this->akceManager->getAll($order);
	}
        
        public function renderDetail($id = 1):void {
            $this->template->akce = $this->akceManager->getById($id);
        }
        
        public function actionDelete($id):void{
            $this->akceManager->delete($id);
            $this->flashMessage('Záznam odstraněn', 'info');
            $this->redirect('list');
        }
        
        public function actionInsert($values):void {
            
        }
        
        public function actionUpdate($id, $values):void {
            
        }
}
