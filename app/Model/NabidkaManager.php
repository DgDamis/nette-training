<?php

declare(strict_types = 1);

namespace App\Model;

use Nette;

/**
 * Users management.
 */
final class NabidkaManager {

    use Nette\SmartObject;

    private

    const
            TABLE_NAME = 'nabidka',
            COLUMN_ID = 'id',
            COLUMN_DESTINACE = 'destinace',
            COLUMN_POPIS = 'popis',
            COLUMN_CENA = 'cena',
            COLUMN_DATUM = 'datum',
            COLUMN_DELKA = 'delka',
            COLUMN_DOPRAVA = 'doprava';

    /** @var Nette\Database\Context */
    private $database;

    public function __construct(Nette\Database\Context $database) {
        $this->database = $database;
    }

    public function getAll($order = self::COLUMN_DATUM) {
        return $this->database->table(self::TABLE_NAME)->order($order)->fetchAll();
    }

    public function getById($id) {
        return $this->database->table(self::TABLE_NAME)->get($id);
    }

    public function insert($values) {
        try {
            $this->database->table(self::TABLE_NAME)->insert($values);
            return true;
        } catch (Nette\Database\DriverException $e) {
            return false;
        }
    }

    public function update($id, $values) {
        if ($zaznam = $this->getById($id))
            return $zaznam->update($values);
        return false;
    }

    public function delete($id) {
        if ($zaznam = $this->getById($id))
            return $zaznam->delete();
        return false;
    }

}
