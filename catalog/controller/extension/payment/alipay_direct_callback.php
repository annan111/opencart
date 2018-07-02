<?php
// Version
define('VERSION', '2.3');

// Configuration
require_once('../../../config.php');

date_default_timezone_set('PRC');

// Startup
require_once(DIR_SYSTEM . 'startup.php');

$application_config = 'catalog';

$pay_method_callback = 'extension/payment/alipay_direct/callback';


// Application
require_once(DIR_SYSTEM . 'framework.php');