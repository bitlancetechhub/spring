<?php

namespace App\Repositories\User;

use App\Repositories\User\UserInterface as UserInterface;
use App\User;

class UserRepository implements UserInterface
{
    public $user;

    function __construct(User $user) {
	$this->user = $user;
    }

    public function getAll()
    {
        return $this->user->where('deleted_at',null)->get();
    }

    public function find($id)
    {
        return $this->user->findUser($id);
    }

    public function delete($id)
    {
        return $this->user->deleteUser($id);
    }
}