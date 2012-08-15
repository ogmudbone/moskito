<%@ page language="java" contentType="text/html;charset=UTF-8" session="true"
%><%@ taglib uri="http://www.anotheria.net/ano-tags" prefix="ano" 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>MoSKito Recorded Journey Call: <ano:write name="recordedUseCase" property="name"/></title>
	<link rel="stylesheet" href="mskCSS"/>
<ano:define id="IMG" type="java.lang.String"><img src="<ano:write name="mskPathToImages" scope="application"/>msk_l.gif" border="0" alt=""></ano:define
><ano:define id="EMPTY" type="java.lang.String"><img src="<ano:write name="mskPathToImages" scope="application"/>msk_s.gif" border="0" alt=""></ano:define
>

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery.treeTable.js"></script>

    <script>
        $(function() {
            // TREE TABLE
            $("#tree_table").treeTable();
            console.log($("#tree_table"))

            // EXPAND TABLE TREE
            function expandTableTree() {
                var button = $('.expand_table_tree'),
                    table = $('#tree_table'),
                    mainParent = $('#node-0');
                    console.log("variables", button,table,mainParent)
                button.on('click', function() {
                    table.expandAll();
                    console.log(button)

                })
            };

            expandTableTree()



            // JOURNEYS SELECTION
            var positionCheckbox = $('.select_current_row_positions_checkbox');

            positionCheckbox.on('change', function(){

                var $this = $(this),
                    $thisTr = $this.parents('table.journeys_summary_table tr'),
                    PositionListLink = $thisTr.find($('td.journeys_summary_table_positions_list a')),
                    actionSelect = $this.prop('checked');

                PositionListLink.each(function(a){
                    var lineNumber = ($(this).text()),
                        highlightedTr = $('a[name='+lineNumber+']').parents('tr');


                    if (actionSelect) {
                        highlightedTr.find('td').addClass('td_select_highlight') ;
                    }else {
                        highlightedTr.find('td').removeClass('td_select_highlight')
                    }
                })
            });


            // DESELECT BUTTON
            var deselectPositionsButton = $('.deselect_all_journey_positions');
            deselectPositionsButton.on('click', function(){
                positionCheckbox.each(function() {
                    var $this = $(this);

                    $this.prop('checked', '');
                    $this.change();
                })
            })


            // SCROLL FIX
            var summaryPositionListLik = $('td.journeys_summary_table_positions_list').find('a')
            //console.log($('td.journeys_summary_table_positions_list').find('a'))
            summaryPositionListLik.on('click', function(){
                //console.log($this)
                var $this = $(this);
                $(window).scrollTop()
                //console.log($this)
                $('html').scrollTop(2000)

            })
        })
    </script>

    <style>
    .table_itseft .in table td, .table_itseft .in table th {
        padding: 5px 10px;
    }

    .select_current_row_positions_checkbox {
        margin: 0 auto;
    }

    #tree_table tr:nth-child(even) {
        background:#f7f7f7;
    }

    .deselect_all_journey_positions {
        margin: 0 auto;
        display: block;

        font-size: 12px;
        padding: 1px 8px;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;

        -webkit-box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.1);
        -moz-box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.1);
        box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.2);

        background-color: #4D9CC9;
        background-image: -ms-linear-gradient(top, #7FBFE4, #4D9CC9);
        background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#7FBFE4), to(#4D9CC9));
        background-image: -webkit-linear-gradient(top, #7FBFE4, #4D9CC9);
        background-image: -o-linear-gradient(top, #7FBFE4, #4D9CC9);
        background-image: -moz-linear-gradient(top, #7FBFE4, #4D9CC9);
        background-image: linear-gradient(top, #7FBFE4, #4D9CC9);
        background-repeat: repeat-x;
        border: 1px solid #CCC;
        border-color: #6093CA #3F92B9 #2A628F;
        filter: progid:dximagetransform.microsoft.gradient(startColorstr='#7FBFE4', endColorstr='#4D9CC9', GradientType=0);
        filter: progid:dximagetransform.microsoft.gradient(enabled=false);

        color: white;
        text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.4);
        cursor: pointer;

    }

    .expand_table_tree {
        font-size: 12px;
        margin: 0 30px 0 15px;

        padding: 1px 8px;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;

        -webkit-box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.1);
        -moz-box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.1);
        box-shadow: inset 1px 0 0 rgba(255, 255, 255, 0.125), inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.2);

        background-color: #4D9CC9;
        background-image: -ms-linear-gradient(top, #7FBFE4, #4D9CC9);
        background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#7FBFE4), to(#4D9CC9));
        background-image: -webkit-linear-gradient(top, #7FBFE4, #4D9CC9);
        background-image: -o-linear-gradient(top, #7FBFE4, #4D9CC9);
        background-image: -moz-linear-gradient(top, #7FBFE4, #4D9CC9);
        background-image: linear-gradient(top, #7FBFE4, #4D9CC9);
        background-repeat: repeat-x;
        border: 1px solid #CCC;
        border-color: #6093CA #3F92B9 #2A628F;
        filter: progid:dximagetransform.microsoft.gradient(startColorstr='#7FBFE4', endColorstr='#4D9CC9', GradientType=0);
        filter: progid:dximagetransform.microsoft.gradient(enabled=false);

        color: white;
        text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.4);
        cursor: pointer;
    }

    .journey_stat_call_td span {
        padding-right: 100px;
    }

    .journey_stat_position {
        padding-right: 37px;
    }

    .treeTable tr.collapsed td a.expander {
        background: url('../img/toggle-collapse-dark.png');
    }

    .treeTable tr.expanded td a.expander {
        background: url('../img/toggle-expand-dark.png');
    }

    /*.arrow_down {*/
        /*width: 0;*/
       	/*height: 0;*/
       	/*border-left: 20px solid transparent;*/
       	/*border-right: 20px solid transparent;*/
       	/*border-top: 20px solid #f00;*/
    /*}*/

    </style>

</head>
<body>
<script type="text/javascript" src="../js/wz_tooltip.js"></script>
<jsp:include page="Menu.jsp" flush="false"/>

<div class="main">
	<ul class="breadcrumbs">
		<li class="home_br">You are here:</li>
		<li><a href="mskShowJourneys">Journeys</a></li>
		<li><a href="mskShowJourney?pJourneyName=<ano:write name="journeyName"/>"><ano:write name="journeyName"/></a></li>
		<li class="last"><span><ano:write name="tracedCall" property="name"/> </span></li>
	</ul>
	<div class="clear"><!-- --></div>

	<h1><ano:write name="tracedCall" property="name"/></h1>
	<div class="clear"><!-- --></div>
	<div class="additional">
		<div class="top"><div><!-- --></div></div>
		<div class="add_in">
			<div><span><ano:write name="tracedCall" property="created"/>&nbsp;&nbsp;<ano:write name="tracedCall" property="date"/> &nbsp;&nbsp;</span></div>
		</div>
		<div class="bot"><div><!-- --></div></div>
	</div>
	
	<div class="clear"><!-- --></div>
	<div class="table_layout">
		<div class="top"><div><!-- --></div></div>
		<div class="in">			
			<div class="clear"><!-- --></div>
			<div class="table_itseft">
				<div class="top">
					<div class="left"><!-- --></div>
					<div class="right"><!-- --></div>
				</div>
				<div class="in">
			
				
				<table cellpadding="0" cellspacing="0" width="100%" id="tree_table">
				<thead>
						<tr class="journey_stat_header">
							<th><button class="expand_table_tree">Expand</button>Call</th>
							<th>Gross duration</th>
							<th>Net duration</th>
							<th>Aborted</th>
						</tr>
				</thead>
				<tbody>
						<ano:iterate name="tracedCall" property="elements" type="net.java.dev.moskito.webui.bean.TraceStepBean" id="traceStep" indexId="index">
					   	<%--
					   		<ano:equal name="traceStep" property="aborted" value="true"><tr class="stat_error" id="node-<ano:write name="traceStep" property="id"/>"></ano:equal>
							<ano:notEqual name="traceStep" property="aborted" value="true"><tr class="< %= ((index & 1) == 0 )? "even" : "odd" % >" id="node-<ano:write name="id"/>"></ano:notEqual> 
						--%>
						<tr <ano:equal name="traceStep" property="parentAvailable" value="true">class="child-of-node-<ano:write name="traceStep" property="parentId"/>"</ano:equal> id="node-<ano:write name="traceStep" property="id"/>">
							<td class="journey_stat_call_td" width="25%"><a class="journey_stat_position" name="<ano:write name="traceStep" property="niceId"/>"><ano:write name="traceStep" property="niceId"/></a><span
                                onmouseover="Tip('<ano:write name="traceStep" property="fullCall" filter="true"/>', WIDTH, 500)" onmouseout="UnTip()">
                                <ano:write name="traceStep" property="call" filter="true"/>
							</span></td>
							<%--<td onmouseover="Tip('<ano:write name="traceStep" property="fullCall" filter="true"/>', WIDTH, 500)" onmouseout="UnTip()"><% for (int i=1; i<traceStep.getLayer(); i++){ %><%= EMPTY %><%}%><ano:equal name="traceStep" property="root" value="false"><%=IMG%></ano:equal><ano:write name="traceStep" property="call" filter="true"/></td>--%>
							<td><ano:write name="traceStep" property="duration"/></td>
							<td><ano:write name="traceStep" property="timespent"/></td>
							<td><ano:equal name="traceStep" property="aborted" value="true">X</ano:equal></td>
						</tr>
						</ano:iterate>
				</tbody>
				</table>
				
		
					<div class="clear"><!-- --></div>
				</div>
				<div class="bot">
					<div class="left"><!-- --></div>
					<div class="right"><!-- --></div>
				</div>
			</div>
		</div>
		<br/><br/>
		<!-- duplicates -->
		<ano:present name="dupStepBeansSize">
		<div class="clear"><!-- --></div>
		<div class="table_layout">
			<div class="top"><div><!-- --></div></div>
			<div class="in">			
				<div class="clear"><!-- --></div>
				<div class="table_itseft">
					<div class="top">
						<div class="left"><!-- --></div>
						<div class="right"><!-- --></div>
					</div>
					<div class="in">
				
					
					<table class="journeys_summary_table" cellpadding="0" cellspacing="0" width="100%">
					<thead>
							<tr class="stat_header">
								<th>Duplicate (<ano:write name="dupStepBeansSize"/>)</th>
                                <th><button class="deselect_all_journey_positions">Reset</button></th>
                                <th>Calls</th>
								<th>Positions</th>
								<th>Time / Duration</th>
							</tr>
					</thead>
					<tbody>
							<ano:iterate name="dupStepBeans" type="net.java.dev.moskito.webui.bean.JourneyCallDuplicateStepBean" id="dupStep" indexId="index">
							 <tr>
							 	<td><ano:write name="dupStep" property="call"/></td>
                                <td><input type="checkbox" class="select_current_row_positions_checkbox" value=""/></td>
                                <td><ano:write name="dupStep" property="numberOfCalls"/></td>
							 	<td class="journeys_summary_table_positions_list" style="white-space: normal;">
							 		<ano:iterate name="dupStep" property="positions" type="java.lang.String" id="position"><a href="#<ano:write name="position"/>"><ano:write name="position"/></a> </ano:iterate>
							 	</td>
							 	<td><ano:write name="dupStep" property="timespent"/> / <ano:write name="dupStep" property="duration"/></td>
							 </tr>
							</ano:iterate>
					</tbody>
					</table>
					
			
					<div class="clear"><!-- --></div>
				</div>
				<div class="bot">
					<div class="left"><!-- --></div>
					<div class="right"><!-- --></div>
				</div>
			</div>
		</div>
	</ano:present>
</div>
</body>
</html>