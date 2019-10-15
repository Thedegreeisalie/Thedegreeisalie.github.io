# Task 4:
Task: Write a code that will generate a symmetric, positive definite matrix for a given integer, n. Make sure that you add an entry to your software manual with a couple of examples. Your examples should be relatively small for your examples, but you should include a large example in the task solution write-up.
# Proof
[generatePosDef](https://thedegreeisalie.github.io/Math5610/softwareManual/generatePosDef)

A larger matrix example

	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw5/task4/build$ ./Task4 20
	0.0887046 0.796692 0.72563 0.223495 0.636892 0.188096 0.202899 0.878292 0.865169 0.91146 0.799152 0.519677 0.434195 0.906664 0.873226 0.983235 0.220191 0.887269 0.401909 0.565273 
	0.983055 0.510486 0.718632 0.000466753 0.803385 0.258857 0.631172 0.817282 0.486371 0.143945 0.000183515 0.910563 0.768031 0.00184691 0.468412 0.221328 0.281049 0.492387 0.986299 0.892768 
	0.491252 0.380722 0.243072 0.654558 0.250099 0.188178 0.219136 0.573799 0.630025 0.413363 0.659993 0.388846 0.155099 0.949061 0.801355 0.688697 0.0724485 0.600244 0.299325 0.622469 
	0.418793 0.517794 0.620307 0.932126 0.742455 0.885118 0.308595 0.83023 0.849229 0.252933 0.998906 0.816579 0.957059 0.719384 0.350841 0.4739 0.586262 0.167988 0.572337 0.49475 
	0.339369 0.17158 0.703755 0.560529 0.155592 0.139567 0.229545 0.908573 0.92511 0.6272 0.661413 0.93559 0.894515 0.271364 0.784562 0.0485053 0.213866 0.771387 0.609775 0.709263 
	0.821271 0.534306 0.353061 0.144674 0.353375 0.30116 0.69542 0.117143 0.257237 0.701446 0.804854 0.646961 0.320731 0.263168 0.505193 0.0761876 0.428161 0.762135 0.897133 0.220472 
	0.245864 0.505254 0.103252 0.449873 0.750204 0.968117 0.369022 0.695985 0.73069 0.220585 0.139942 0.90911 0.120552 0.827661 0.535293 0.240579 0.696564 0.17029 0.817879 0.428314 
	0.44965 0.717644 0.303646 0.677211 0.461888 0.224496 0.323885 0.920362 0.911392 0.464019 0.119954 0.131162 0.0682472 0.00950706 0.60826 0.281549 0.80954 0.341406 0.0834746 0.820343 
	0.995377 0.833778 0.338194 0.38979 0.502874 0.813492 0.724074 0.900821 0.613614 0.427504 0.629519 0.490736 0.069265 0.778746 0.740621 0.548387 0.712695 0.0221536 0.515906 0.680259 
	0.179776 0.220156 0.858839 0.657405 0.390886 0.73259 0.211151 0.523796 0.508339 0.634312 0.0994187 0.47895 0.717763 0.669861 0.000653455 0.196682 0.180461 0.00313823 0.703931 0.519933 
	0.190766 0.395973 0.35447 0.428089 0.627579 0.649973 0.247958 0.693218 0.881796 0.647223 0.449218 0.71019 0.39886 0.32106 0.204806 0.910176 0.639204 0.756282 0.734925 0.511464 
	0.0385296 0.163038 0.118764 0.542598 0.294118 0.18108 0.544827 0.289631 0.733469 0.00962433 0.181258 0.993378 0.869252 0.82858 0.66895 0.119596 0.614777 0.271349 0.329704 0.0595599 
	0.201245 0.774922 0.465641 0.961447 0.576854 0.16813 0.0456572 0.248004 0.460648 0.993406 0.96246 0.599141 0.10924 0.787177 0.0163384 0.715512 0.0376921 0.159339 0.179314 0.827946 
	0.901795 0.638106 0.901803 0.959209 0.382955 0.148665 0.0799669 0.404907 0.949585 0.663181 0.480942 0.726462 0.940162 0.583633 0.75056 0.460219 0.2374 0.881889 0.221141 0.992184 
	0.468916 0.27491 0.0744521 0.496715 0.98451 0.262261 0.816627 0.585594 0.277743 0.675459 0.231035 0.955776 0.568565 0.75309 0.353759 0.396493 0.229466 0.963811 0.470902 0.616434 
	0.571295 0.728649 0.319038 0.143905 0.187245 0.82217 0.285422 0.769013 0.0493628 0.672364 0.842306 0.447614 0.873744 0.493049 0.279769 0.561278 0.821731 0.757508 0.911396 0.351624 
	0.403256 0.857108 0.702688 0.866029 0.492346 0.799508 0.667064 0.19063 0.0834673 0.0940898 0.00323947 0.15379 0.472472 0.782259 0.620023 0.429999 0.0335127 0.484693 0.939845 0.982356 
	0.900267 0.555898 0.174276 0.829975 0.36448 0.879371 0.585851 0.667161 0.236789 0.401551 0.751343 0.521549 0.171595 0.305004 0.707734 0.592119 0.155275 0.143091 0.535817 0.268091 
	0.997764 0.470641 0.580454 0.353349 0.359761 0.804025 0.506864 0.79025 0.968677 0.152092 0.825269 0.125378 0.865234 0.573266 0.93842 0.33136 0.872676 0.793809 0.0356026 0.707163 
	0.697594 0.54224 0.503582 0.263458 0.541807 0.125427 0.180042 0.96442 0.472899 0.826689 0.689735 0.85284 0.0565732 0.0166555 0.927203 0.818529 0.00806474 0.952501 0.796026 0.466937