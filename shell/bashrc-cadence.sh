export CDSHOME=/usr/eelocal/cadence/ic617-706
export CDS_LIC_FILE=/usr/eelocal/cadence/license/license.80816eab
export CDS_LICENSE_DIR=${CDSHOME}/share/license

export CDS_AUTO_64BIT=ALL

# # Calibre
source /usr/eelocal/mentor/cal_2014.4_39/.bashrc

export MGC_CALIBRE_PRESERVE_MENU_TRIGGER
# #
source /usr/eelocal/cadence/rc142/.bashrc
source /usr/eelocal/cadence/assura41hf10_617/.bashrc

source /usr/eelocal/cadence/ext151/.bashrc
source /usr/eelocal/cadence/incisiv152hf/.bashrc
source /usr/eelocal/cadence/edi142/.bashrc

#
if [ ! $?CDS_Netlisting_Mode ]; then
	export CDS_Netlisting_Mode=Analog
fi

#
export PATH=${CDSHOME}/tools/bin:${CDSHOME}/tools/dfII/bin:${PATH}
#
# source /usr/eelocal/cadence/mmsim141/.bashrc
