<?php

namespace App\Filters;

use Illuminate\Http\Request;

class ApiFilter
{
    protected $safeParams = [];

    protected $columnMap = [];

    protected $operatorMap = [];

    public function transform(Request $request)
    {
        $eloQuery = [];

        foreach ($this->safeParams as $safeParam => $operators) {
            $query = $request->query($safeParam);

            if (!isset($query)) {
                continue;
            }

            $column = $this->columnMap[$safeParam] ?? $safeParam;

            foreach ($operators as $operator) {
                if (isset($query[$operator])) {

                    if ($operator === 'like') {
                        $query[$operator] = '%' . $query[$operator] . '%';
                    }

                    if ($operator === 'orLike') {
                        $query[$operator] = '%' . $query[$operator] . '%';
                        $eloQuery[] = [$column, $this->operatorMap[$operator], $query[$operator], 'or'];
                    }

                    if ($operator !== 'orLike')
                        $eloQuery[] = [$column, $this->operatorMap[$operator], $query[$operator]];
                }
            }
        }

        return $eloQuery;
    }
}
