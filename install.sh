clear
echo "================================";
echo "== SWGANH Portal Installation ==";
echo "================================";
echo "";
echo "Requirements";
echo "------------";
echo " 1) Git 1.7 or later.";
echo " 2) PHP 5 or later.";
echo "";
read -p "Press any key to continue...";

if [ ! -d "vendor" ]; then
	echo "Installing vendors...";
	php bin/vendors install;
fi

php app/console doctrine:database:drop --force
php app/console doctrine:database:create
php app/console doctrine:schema:create
php app/console doctrine:fixtures:load --fixtures=vendor/bundles/Anh/SwgManagerBundle/DataFixtures/ORM --append
php app/console fos:user:create
php app/console swg:players:sync