<?php

declare(strict_types=1);

namespace App\Presenters;
use App\Model;

use Tracy\Debugger;


final class KnihaPresenter extends BasePresenter
{
        private $knihaManager;
        
        public function __construct(Model\KnihaManager $knihaManager) {
            $this->knihaManager = $knihaManager;
        }
    
	public function renderDefault(): void
	{
		$this->template->anyVariable = 'any value';
	}
        
        public function renderList($order = 'title'): void{
            $this->template->knihaList = $this->knihaManager->getAll($order);
        }
        
        public function renderDetail($id): void{
            $this->template->kniha = $this->knihaManager->getById($id);
        }
        
        public function actionInsert($values): void{
            
        }
        
        public function actionUpdate($id,$values): void{
            
        }
        
        public function actionDelete($id):void{
            $this->knihaManager->delete($id);
            $this->redirect('list');
        }
}
