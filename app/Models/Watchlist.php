<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class Watchlist
 * @package App\Models
 *
 * @property int id
 * @property int user_id
 * @property int movie_id
 * @property Carbon created_at
 * @property Carbon updated_at
 * @property Carbon deleted_at
 */
class Watchlist extends Model {

    use SoftDeletes;

    protected $table = 'watchlists';
    protected $primaryKey = 'id';
    protected $fillable = [
        'user_id', 'movie_id',
    ];

}
