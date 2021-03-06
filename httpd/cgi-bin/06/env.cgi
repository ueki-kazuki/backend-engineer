#!/usr/bin/php

<?php
while(list($key,$value) = each($_ENV)) {
    echo("$key = $value\n");
}
?>
