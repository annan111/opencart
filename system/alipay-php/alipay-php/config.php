<?php
$config = array (	
		//应用ID,您的APPID。
		'app_id' => "2018060660326776",

		//商户私钥
		'merchant_private_key' => "MIIEpQIBAAKCAQEA/V/zUp3xJJtjl/XPhtV2C0+NGYmDZCPc0dmivdzJx/c6aU2k/YA0W98UwdXmnBXCb1VlAPoW1UTqmR7dd+Vwc6ny01zNjo28ayyimj+aa02OUS4skGkbbaCWBC7TfJ/9qfVz8Z7TktLsyM+uxPTon0275SvjaGmfbhWO+odrNI830sJt8JkG7IUE9uXOUjXVt7gOLAxG9zuotNGgADKNAhKevAJTuD4jKy+8436q1ofvQ72kAfRwBWJ0iIcfLXFdMi3uxDN2aHgJHFHnJMuRZmyulezNZK7xePq1YbksOS5/8cYKEwLsnt640PVGktpGew0DUQIVdIpf7vXlxZ/RYwIDAQABAoIBADNPsx8QDT20mj6z8QsFP5qayaBaUNl+ycFVqbd5dwOf9ZxNtRQBWpkgXDvE7aa+YVnamVHRU75s7nWD4qXdOSCzUhGrwZUU7wtlRqimKMeCNUgLacr0/jD9TGQcd4fNfrlkk85is8YQIROpu2L3lgRs4ZhPgwYqHbdVdlcWBYfm8eeXmbWOHn4tYz6yLsFtM9BP09IaFdsjpQKhS6JOHfffPGBsdZ4N7RsxqOpY8QXl72V5J2B6SycUYVOkBWDnlc1ALxH7z+pBexmaEcKZKjg+VB6qCWv0wA/q09pRyrT8nbm9tj3cIfmO3VKXL8d5ambrOSjdTizPwDOzf0obOsECgYEA/sXBNGfyAlYineZHFP5xoyQ94M8EEtaHKGRIGz1IKBANU0Hd2CVVWg6Y9Fwce3CiGYCzPRNaoNzImIR724L0ELWnH2S0I0vSwQbNsZ+dwyzJJNzK9Oi38rrSiKh/er7xXkodvoAdKiH2G2MIXq9zzblbdP9O5QaN8XMUddZD798CgYEA/ph4yi1N5y+KCGTsPJNEBPLFPxJi8EjzdO3Pw1d7cLYz0H+ueTXySrXXqyH3VnX3Uv7m+LktaeelRUEzrIBr4v/iE//FCTwZEKCarGcvt/o0983YZHtiAjOvboO5rGipGJUS7HM32xFWqNH8SoShiULljoyFiDDrXFzyggkUfv0CgYEA1Q1grUeDjUqktjC9HqRNOWV0TYww1uQJsNBzsDvGHKKX0hkRwNAvmRj99dMVinC9TeBfg2Ks9jrLkSexP/c5zMNr14fqUF33B6590t0tG+tW5fmxy67VLSnoJ5noySfmRrhqOUV/nh06ZtqhRDUq/U3VWniqbEHX76MR6BzfQTcCgYEA9Iq1ctTDQC0Mc3Wk56Y4LlyVkzhw6gXYOtb1uda8jY2lBT6u8mQbvyEc75angVe74O9QIVWUxmWm/HddT/LmLdrEZ5tDwdQE61CoYLKYRinBWMhScmmEwUKt3gQOgwjgauk9jPo6i2QDDhLsNxNgKXylDB/zXtZGK6hnkvlvw20CgYEAkuX61WBVaKMrX1/7eAmYpW5zx2AIkbUfDcOpwm2rFW7kBjKD790XgH7a7IgdKnb8Q89sbu83gDLpa/J7tbf2ZLqXTiY/Vq1hbUtEZSyakFlnJdO2acwLO7ehBZ8E0y7BDQlDaMQ/l5EczW5ddvvxJHS3BuaHokolBfUfNBBoSLk=",
		
		//异步通知地址
		'notify_url' => "http://外网可访问网关地址/alipay.trade.page.pay-PHP-UTF-8/notify_url.php",
		
		//同步跳转
		'return_url' => "http://外网可访问网关地址/alipay.trade.page.pay-PHP-UTF-8/return_url.php",

		//编码格式
		'charset' => "UTF-8",

		//签名方式
		'sign_type'=>"RSA2",

		//支付宝网关
		'gatewayUrl' => "https://openapi.alipay.com/gateway.do",

		//支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
		'alipay_public_key' => "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiotUXDcwdxn/K+0326H4L1s8HkmSrBn1CdoLNt3H/Rj3m6RfQNTCSAWOCm6+YIaXZDABcumFPQ24i0Aorzq3Ria7DZYKUDcIaEygJsfjtIjHDBUq4gx4DcGzbU/yoDFMRUZEJy8TWGE8G20xEbrNPBaBC2s1cSaA4heiYU7lo5LLFjeC+PCbCZjWLSF97Pk1BkOI6EdDaSO7+Qysp9bZPKEqgeCC6M6dD6CCT1NXXN0TYPl5kbZx2pVPoR9z4vQo1BYkFnDoqUtmnjI6jiAkFwk12qo6zht3mOJ5/ccdmK9ZXaIv/TYiL3V0i62hYcGOrIn5xgFdMcyDSx65JF52yQIDAQAB",
);