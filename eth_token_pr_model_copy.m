%%% Created by: Maxwell Tardif, Date: 11/22/2022

%%% This section of code reads the ETH daily average gas price file, saves it into a matrix, saves the daily average gas prices into a separate matrix, 
%%% then divides by one billion to change units from wei to gwei, and again for gwei to eth

agpdata = readtable('export-AvgGasPrice.csv');
dvalwei = agpdata.Value_Wei_(1:end);
dvalgwei = (1/1000000000) * dvalwei;
dgvaleth = (1/1000000000) * dvalgwei;

%%% This section of code reads the daily gas used file, saves it into a matrix, and then saves the daily gas used into a separate matrix

dgudata = readtable('export-GasUsed.csv');
gasused = dgudata.Value(1:end);

%%% This section of code reads the daily average ETH price file, and saves the daily ETH price into a separate matrix

depdata = readtable('export-EtherPrice.csv');
ethprice = depdata.Value(1:end);

%%%Calculates daily market cap in terms of USD

dethmsupp = readtable('export-Ethersupply');
supply = dethmsupp.Value(1:end);
dmcap = ethprice .* supply;

%%%Calculates daily revenue in terms of ETH and USD as well as annualized revenue based off of each daily marketcap

dethrev = dgvaleth .* gasused;
usdethrev = (dgvaleth .* gasused) .* ethprice;
annualusdrev = 365 * (usdethrev);

%%%Calculates daily PR ratio

ethpr  = dmcap ./ annualusdrev;

%%%Plots daily revenue in terms of ETH and USD as well as daily Profit-Revenue ratio over the entire history of the Ethereum blockchain/over specific time frames

figure(1); clf
x = length(dethrev);
y = linspace(1,x, 2672);
plot(y, dethrev)
xlabel("Days since genesis of network (through 11/22/2022)")
ylabel("Daily revenue (ETH)")
title("Daily Ethereum revenue in ETH over time (-MRT)")

figure(2); clf
plot(y, usdethrev,"g")
xlabel("Days since genesis of Ethereum network (through 11/22/2022)")
ylabel("Daily blockchain revenue (USD)")
title("Daily Ethereum revenue in USD over time (-MRT)")

figure(3); clf
plot(y, ethpr, "r")
xlabel("Days since genesis of network (through 11/22/2022)")
ylabel("Daily blockchain PR ratio")
title("Daily ETH PR Ratio over time (-MRT)")

figure(4); clf
plot(y(1000:end),ethpr(1000:end), "cy")
xlabel("Days (From 1000 days after genesis through 11/22/2022)")
ylabel("Daily blockchain PR ratio")
title("Daily ETH PR Ratio (1000 days after genesis through November, 2022 -MRT)")

figure(5); clf
subplot(5,1,1)
plot(y, dethrev)
xlabel("Days since genesis of network (through 11/22/2022)")
ylabel("Daily blockchain revenue (ETH)")
title("Daily Ethereum revenue in ETH over time (-MRT)")
subplot(5,1,2)
plot(y, usdethrev, "g")
xlabel("Days since genesis of network (through 11/22/2022)")
ylabel("Daily blockchain revenue (USD)")
title("Daily Ethereum revenue in USD over time (-MRT)")
subplot(5,1,3)
plot(y, ethpr, "r")
xlabel("Days since genesis of network (through 11/22/2022)")
ylabel("Daily blockchain PR ratio")
title("Daily ETH PR Ratio over time (-MRT)")
subplot(5,1,4)
plot(y(1000:end),ethpr(1000:end), "cy")
xlabel("Days (From 1000 days after genesis through 11/22/2022)")
ylabel("Daily blockchain PR ratio")
title("Daily ETH PR Ratio (1000 days after genesis through November, 2022 -MRT)")

figure(6); clf
subplot(6,1,1)
plot(y, dethrev)
xlabel("Days since genesis of network (through 11/22/2022)")
ylabel("Daily blockchain revenue (ETH)")
title("Daily Ethereum revenue in ETH over time (-MRT)")
subplot(6,1,2)
plot(y, usdethrev, "g")
xlabel("Days since genesis of network (through 11/22/2022)")
ylabel("Daily blockchain revenue (USD)")
title("Daily Ethereum revenue in USD over time (-MRT)")

figure(7); clf
subplot(7,1,1)
plot(y, ethpr, "r")
xlabel("Days since genesis of network (through 11/22/2022)")
ylabel("Daily blockchain PR ratio")
title("Daily ETH PR Ratio over time (-MRT)")
subplot(7,1,2)
plot(y(1000:end),ethpr(1000:end), "cy")
xlabel("Days (From 1000 days after genesis through 11/22/2022)")
ylabel("Daily blockchain PR ratio")
title("Daily ETH PR Ratio (1000 days after genesis through November, 2022 -MRT)")