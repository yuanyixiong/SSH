var $qingshixun = {
    v : {
        ajaxOption : {
            method : 'get',
            dataType : 'json',
            async : true
        },
        notifyMethod : null
    },

    uiform : function() {
        jQuery('tbody input:checkbox').click(function() {
            if (jQuery(this).is(':checked')) {
                jQuery(this).parent().addClass('checked');
                jQuery(this).parents('tr').addClass('warning');
            } else {
                jQuery(this).parent().removeClass('checked');
                jQuery(this).parents('tr').removeClass('warning');
            }
        });
    },

    // 全选、反选操作
    checkAll : function(obj) {
        var parentTable = jQuery(obj).parents('table');
        var ch = parentTable.find('tbody input[type=checkbox]');
        if (jQuery(obj).is(':checked')) {
            ch.each(function() {
                jQuery(this).prop('checked', true);
                jQuery(this).parent().addClass('checked');
                jQuery(this).parents('tr').addClass('warning');
            });
        } else {
            ch.each(function() {
                jQuery(this).removeAttr('checked')
                jQuery(this).parent().removeClass('checked');
                jQuery(this).parents('tr').removeClass('warning');
            });
        }
    },

    dataTable : function(obj, option) {
        var dataTableL = {
            "processing" : true,
            "serverSide" : true,
            "ordering" : true,
            "searching" : false,
            "lengthMenu" : [ [ 10, 20, 30, -1 ], [ 10, 20, 30, "全部" ] ],
            "dom" : "'<t><'dt-row dt-bottom-row'<'row'<'col-sm-6'il><'col-sm-6 text-right'p>>>'",
            "language" : {
                "sProcessing" : "处理中...",
                "sLengthMenu" : "_MENU_",
                "sZeroRecords" : "表中数据为空",
                "sInfo" : "第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty" : "第 0 至 0 项结果，共 0 项",
                "sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix" : "",
                "sSearch" : "搜索:",
                "sUrl" : "",
                "sEmptyTable" : "表中数据为空",
                "sLoadingRecords" : "载入中...",
                "sInfoThousands" : ",",
                "oPaginate" : {
                    "sFirst" : "首页",
                    "sPrevious" : "上页",
                    "sNext" : "下页",
                    "sLast" : "末页"
                },
                "oAria" : {
                    "sSortAscending" : ": 以升序排列此列",
                    "sSortDescending" : ": 以降序排列此列"
                }
            }
        };
        return obj.DataTable($.extend(dataTableL, option));
    }

}

// 批量 勾选操作
$(function() {
    // 创建getInputId方法
    $.fn.getInputId = function(sigle) {
        var checkIds = [];
        this.each(function() {
            checkIds.push($(this).val())
        });

        if (sigle) {
            if (checkIds.length > 1) {
                toastr.error('只能选择一条记录！');
                return false;
            } else if (checkIds.length == 0) {
                toastr.error('请选择一条记录操作！');
                return false;
            } else {
                return checkIds[0];
            }
        } else {
            if (checkIds.length == 0) {
                toastr.error('请选择至少一条记录操作！');
                return false;
            } else {
                return checkIds;
            }
        }
    };
});
