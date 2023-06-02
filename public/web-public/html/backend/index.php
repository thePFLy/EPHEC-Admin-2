<!DOCTYPE html>
<html>
<head>
    <title>Liste des produits</title>
</head>
<body>
	<?php

        $dbHost = 'db';
        $dbName = getenv('MYSQL_DATABASE');
        $dbUser = getenv('MYSQL_USER');
        $dbPass = getenv('MYSQL_PASSWORD');
        
        $connection = new PDO("mysql:host=$dbHost;dbname=$dbName;charset=utf8", $dbUser, $dbPass);
        $query      = $connection->query("SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'woodytoys'");
        $tables     = $query->fetchAll(PDO::FETCH_COLUMN);

        if (empty($tables)) {
            echo '<p class="center">There are no tables in database <code>demo</code>.</p>';
        } else {
            echo '<p class="center">Database <code>woodytoys</code> contains the following tables:</p>';
            echo '<ul class="center">';
            foreach ($tables as $table) {
                echo "<li>{$table}</li>";
                $query  = $connection->query("SELECT * FROM {$table}");
                $result = $query->fetchAll(PDO::FETCH_ASSOC);
                if (count($result) > 0) {
                    echo "<ul class='indent'>";
                    foreach ($result as $row) {
                        echo "<li>";
                        foreach ($row as $key => $value) {
                            echo "{$key}: {$value} ";
                        }
                        echo "</li>";
                    }
                    echo "</ul>";
                }
            }
            echo '</ul>';
        }
        ?>
</body>
</html>