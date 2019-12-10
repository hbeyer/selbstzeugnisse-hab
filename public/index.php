<?php

$filename = __DIR__.preg_replace('#(\?.*)$#', '', $_SERVER['REQUEST_URI']);
if (php_sapi_name() === 'cli-server' && is_file($filename)) {
    return false;
}

require_once __DIR__ . '/../vendor/autoload.php';

$app = new Silex\Application();

@include __DIR__ . '/../config/services.php';
@include __DIR__ . '/../config/controllers.php';
@include __DIR__ . '/../config/routes.php';

$app['debug'] = true;

return $app->run();