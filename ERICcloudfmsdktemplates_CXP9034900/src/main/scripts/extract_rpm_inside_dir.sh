#!/bin/bash -x
l_rpm_copied_path=$1
if [[ ! -f ${l_rpm_copied_path} ]]; then
        echo "RPM path n is not valid"
        exit 1
fi
l_pwd=`pwd`
cd `dirname ${l_rpm_copied_path}`
rpm2cpio ${l_rpm_copied_path} | cpio -idmv > /dev/null 2>&1
l_return_code=$?
cd ${l_pwd}
if [[ ${l_return_code} -ne 0 ]]; then
        echo "RPM extraction failed"
        exit 1
fi
exit 0
