<?php

$app->get('/', 'controller.staticpage:handle')
    ->bind('home');

$app->get('/edition/', 'controller.staticpage:handle')
    ->bind('edition');

$app->get('/edition/beschreibung',  'controller.staticpage:handle')
    ->bind('edition.beschreibung');

$app->get('/edition/richtlinien',  'controller.staticpage:handle')
    ->bind('edition.richtlinien');

$app->get('/edition/diarium/register.xml', 'controller.staticpage:handle')
    ->bind('edition.diarium.register');

$app->get('/edition/diarium/download', 'controller.staticpage:handle')
    ->bind('edition.diarium.download');

$app->get('/edition/diarium/{metsId}', 'controller.dynamicpage:handle')
    ->bind('edition.diarium.jahr')
    ->convert('metsId', function ($metsId) { return "edition.diarium.{$metsId}"; });

$app->get('/edition/diarium/', 'controller.staticpage:handle')
    ->bind('edition.diarium');

$app->get('/edition/personen', 'controller.staticpage:handle')->bind('edition.personen');

$app->get('/edition/orte', 'controller.staticpage:handle')
    ->bind('edition.orte');

$app->get('/repertorium/', 'controller.staticpage:handle')
    ->bind('repertorium');

$app->get('/repertorium/suche/', 'controller.repertorium.results:handle')
    ->bind('repertorium.suche');

$app->get('/repertorium/eintrag/{metsId}', 'controller.dynamicpage:handle')
    ->bind('repertorium.eintrag')
    ->convert('metsId', function ($metsId) { return "repertorium.eintrag.{$metsId}"; });

$app->get('/repertorium/liste', 'controller.repertorium.list:handle')
    ->bind('repertorium.liste');


$app->get('/repertorium/vokabular', 'controller.staticpage:handle')
    ->bind('repertorium.vokabular');

$app->get('/bibliographie', 'controller.staticpage:handle')
    ->bind('bibliographie');

$app->get('/projekt', 'controller.staticpage:handle')
    ->bind('projekt');

$app->get('/extern', 'controller.staticpage:handle')
    ->bind('extern');

$app->get('/impressum', 'controller.staticpage:handle')
    ->bind('impressum');

$app->get('/dienste', 'controller.staticpage:handle')
    ->bind('dienste');

$app->get('/suche', 'controller.search:handle')
    ->bind('suche');

$app->get('/ludwig-rudolf', 'controller.staticpage:handle')->bind('ludwig-rudolf');