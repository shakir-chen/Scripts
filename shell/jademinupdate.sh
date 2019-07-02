#!/bin/bash

svn update --set-depth infinity ruby                # processor
svn update --set-depth infinity dramsim2            # memory
svn update --set-depth infinity network             # switch
svn update --set-depth infinity slicc               # cache
svn update --set-depth infinity support             # power, dvfs, and pmu
svn update --set-depth infinity utils/mcpat         # mcpat/ power, dvfs, and pmu
svn update --set-depth infinity utils/cosmic        # mcpat/ power, dvfs, and pmu
svn update --set-depth infinity common              #
svn update --set-depth infinity processor           #
svn update --set-depth infinity protocols           #
# svn update --set-depth empty    scripts/calc_host.sh    #
svn update --set-depth infinity scripts

svn update --set-depth immediates architectures         #
svn update --set-depth immediates applications           #
svn update --set-depth infinity architectures/config    #
svn update --set-depth infinity applications/cosmicApi     # mcpat/ power, dvfs, and pmu
svn update --set-depth infinity architectures/pwr       # needed by mcpat VPATH

# script/calc_host.sh should change to bash in my computer instead of csh
