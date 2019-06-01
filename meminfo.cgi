#!/bin/bash
# arithmetic expansion operator $((...)) calculate content instead of pass as string
echo -e "Content-type: text/html\n\n"

# cat /proc/meminfo

total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
free=$(grep MemFree /proc/meminfo | awk '{print $2}')
swap=$(grep SwapTotal /proc/meminfo | awk '{print $2}')
swapFree=$(grep SwapFree /proc/meminfo | awk '{print $2}')
buffers=$(grep Buffers /proc/meminfo | awk '{print $2}')
cached=$(grep Cached /proc/meminfo | head -1 | awk '{print $2}')
used=$(($total-$free-$buffers-$cached))
percentUsed=$((100*$used/$total))
percentFree=$((100-$percentUsed))
percentBuffers=$((100*$buffers/$total))
percentCached=$((100*$cached/$total))
swapUsed=$(($swap-swapFree))

#echo '<style type="text/css">
#	#ramBar {
#		box-shadow: inset -1px 4px 5px #CCC;
#		display: flex;
#		border-radius: 10px;
#		background-color:#EEE;
#		border: 1px solid #CCC;
#		text-align: center;
#		font-size:80%;
#	}
#	#used {
#		padding: 5px;
#		border-radius: 9px 0px 0px 9px;
#		color:#FFF;
#		background-color:#8BF;
#		width: '$percentUsed'%;
#	}
#	#buffers {
#		box-shadow: inset 0px 3px 1px #CCC;
#		padding: 5px;
#		background-color:#E0E0E0;
#		width: '$percentBuffers'%;
#	}
#	#cached {
#		box-shadow: inset 0px 4px 1px #CCC;
#		padding: 5px;
#		background-color:#E7E7E7;
#		width: '$percentCached'%;
#	}
# </style>'
#
#echo "<h3>RAM STATUS</h3>"

#echo '<div id="ramBar">
#		<div id="used">'$percentUsed'%</div>
#		<div id="buffers"></div>
#		<div id="cached">'$((100*$(($total-$used))/$total))'%</div>
#	</div>'

echo '<div style="width:100%; display: flex; text-align: center; position: relative; bottom:-19px; font-weight: 500; font-size: 12px;">
		<div style="width:'$percentUsed'%; color: #FFF;">'$percentUsed'%</div>
		<div style="width:'$((100*$(($total-$used))/$total))'%;">'$((100*$(($total-$used))/$total))'%</div>
	</div>
	<div class="progress" style="z-index: -1;">
		<div class="progress-bar" role="progressbar" style="width:'$percentUsed'%;"></div>
		<div class="progress-bar" role="progressbar" style="width:'$percentBuffers'%; background-color: black; opacity: 0.1;"></div>
		<div class="progress-bar" role="progressbar" style="width:'$percentCached'%; background-color: black; opacity: 0.05;"></div>
	</div>'

echo '<table class="table table-striped">
	<thead>
		<tr>
			<th  width="20%">RAM</th>
			<th>Usage</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Total</td>
			<td>'$(($total/1024))' MB</td>
		</tr>
		<tr>
			<td>Used</td>
			<td>'$(($used/1024))' MB</td>
		</tr>
		<tr>
			<td>Free</td>
			<td>'$(($(($total-$used))/1024))' MB</td>
		</tr>
		<tr>
			<td>Buffers</td>
			<td>'$(($buffers/1024))' MB</td>
		</tr>
		<tr>
			<td>Cached</td>
			<td>'$(($cached/1024))' MB</td>
		</tr>
		<tr>
			<td>Swap</td>
			<td>'$(($swapUsed/1024))' MB</td>
		</tr>
	</tbody>
  </table>'
 

