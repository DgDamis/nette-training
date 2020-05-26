<?php

declare(strict_types=1);

namespace App\Model;

use Nette;


/**
 * Users management.
 */
final class AkceManager
{
	use Nette\SmartObject;

	private const
		TABLE_NAME = 'event',
		COLUMN_ID = 'id',
		COLUMN_SUMMARY = 'summary',
                COLUMN_DATE = 'date',
                COLUMN_TIME = 'time',
                COLUMN_DESCRIPTION = 'description',
                COLUMN_VISITORS = 'visitors',
                COLUMN_TYPE = 'type';



	/** @var Nette\Database\Context */
	private $database;



	public function __construct(Nette\Database\Context $database)
	{
		$this->database = $database;
	}
        
        public function getAll($order = 'nazev ASC'){
            return $this->database->table(self::TABLE_NAME)->fetchAll($order);
        }
        
        public function getById($id){
            return $this->database->table(self::TABLE_NAME)->get($id);
        }
        
        public function delete($id){
            return $this->database->table(self::TABLE_NAME)->get($id)->delete();
        }

}