prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.3'
,p_default_workspace_id=>4801001554511370018
,p_default_application_id=>78688
,p_default_id_offset=>0
,p_default_owner=>'WKSP_HARTENFELLERDEV'
);
end;
/
 
prompt APPLICATION 78688 - 23.1 Template Components
--
-- Application Export:
--   Application:     78688
--   Name:            23.1 Template Components
--   Date and Time:   13:34 Thursday October 12, 2023
--   Exported By:     HARTENFELLER.DEV@GMAIL.COM
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 74863371235759053245
--   Manifest End
--   Version:         23.1.3
--   Instance ID:     63113759365424
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/template_component/dev_hartenfeller_string_compare
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(74863371235759053245)
,p_plugin_type=>'TEMPLATE COMPONENT'
,p_theme_id=>nvl(wwv_flow_application_install.get_theme_id, '')
,p_name=>'DEV.HARTENFELLER.STRING_COMPARE'
,p_display_name=>'String Multi Compare Multiple'
,p_supported_component_types=>'REPORT'
,p_javascript_file_urls=>'#PLUGIN_FILES#index#MIN#.js'
,p_partial_template=>'<data>#TEXT#</data>'
,p_default_escape_mode=>'HTML'
,p_translate_this_template=>false
,p_api_version=>2
,p_report_body_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<x-str-compare-tc compare-mode="#COMPARE_MODE#" rotate-colors="{if ROTATE_COLORS/}true{else /}false{endif/}" {if SEPARATOR_CHAR/}separator-char="#SEPARATOR_CHAR#"{endif/} >',
'#APEX$ROWS#</x-str-compare-tc>'))
,p_report_row_template=>'<li #APEX$ROW_IDENTIFICATION#>#APEX$PARTIAL#</li>'
,p_report_placeholder_count=>3
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>13
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(74863371598408053261)
,p_plugin_id=>wwv_flow_imp.id(74863371235759053245)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'TEXT'
,p_prompt=>'Text'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>true
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Text that should be compared'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(74878248257196235233)
,p_plugin_id=>wwv_flow_imp.id(74863371235759053245)
,p_attribute_scope=>'REPORT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'COMPARE_MODE'
,p_prompt=>'Compare Mode'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'previous-line'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'first line -> compares all strings to the first. previous line -> compares all strings to the previous line.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(74878085026841992840)
,p_plugin_attribute_id=>wwv_flow_imp.id(74878248257196235233)
,p_display_sequence=>10
,p_display_value=>'previous line'
,p_return_value=>'previous-line'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(74878101719104993688)
,p_plugin_attribute_id=>wwv_flow_imp.id(74878248257196235233)
,p_display_sequence=>20
,p_display_value=>'first line'
,p_return_value=>'first-line'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(74895861744499231324)
,p_plugin_id=>wwv_flow_imp.id(74863371235759053245)
,p_attribute_scope=>'REPORT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'ROTATE_COLORS'
,p_prompt=>'Rotate Colors'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
,p_help_text=>'Off -> yellow diff highlights, On -> rotating diff colors to make it easier to compare the lines.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(74900086904766272259)
,p_plugin_id=>wwv_flow_imp.id(74863371235759053245)
,p_attribute_scope=>'REPORT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'SEPARATOR_CHAR'
,p_prompt=>'Separator Char'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_max_length=>1
,p_is_translatable=>false
,p_examples=>':'
,p_help_text=>'You can pass multiple strings with a separator when e.g. use "listagg" in your query. If you do so set the separator char here so the component can split it back.'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A2A2A2A2A2A2F20282829203D3E207B202F2F207765627061636B426F6F7473747261700A766172205F5F7765627061636B5F6578706F7274735F5F203D207B7D3B0A636C61737320537472436F6D70617265546320657874656E64732048544D4C45';
wwv_flow_imp.g_varchar2_table(2) := '6C656D656E74207B0A2020636F6E7374727563746F722829207B0A20202020737570657228293B0A0A20202020746869732E736861646F77203D20746869732E617474616368536861646F77287B206D6F64653A20276F70656E27207D293B0A20202020';
wwv_flow_imp.g_varchar2_table(3) := '746869732E646976203D20646F63756D656E742E637265617465456C656D656E74282764697627293B0A20202020746869732E736861646F772E617070656E644368696C6428746869732E646976293B0A20207D0A0A2020636F6E6E656374656443616C';
wwv_flow_imp.g_varchar2_table(4) := '6C6261636B2829207B0A20202020746869732E72656E64657228293B0A20207D0A0A202072656E6465722829207B0A202020202F2F2067657420617474726962757465730A20202020636F6E737420636F6D706172654D6F6465203D20746869732E6765';
wwv_flow_imp.g_varchar2_table(5) := '744174747269627574652827636F6D706172652D6D6F64652729207C7C202766697273742D6C696E65273B0A20202020636F6E737420726F74617465436F6C6F7273203D20746869732E6765744174747269627574652827726F746174652D636F6C6F72';
wwv_flow_imp.g_varchar2_table(6) := '732729203D3D3D202774727565273B0A20202020636F6E737420736570617261746F7243686172203D20746869732E6765744174747269627574652827736570617261746F722D636861722729207C7C2027273B0A0A202020202F2F2067657420737472';
wwv_flow_imp.g_varchar2_table(7) := '696E67732066726F6D206461746120656C656D656E74730A20202020636F6E737420737472696E6773203D20746869732E676574496E707574537472696E677328736570617261746F7243686172293B0A0A202020202F2F20636F6D7061726520737472';
wwv_flow_imp.g_varchar2_table(8) := '696E6773202D3E2072657475726E732070726570617265642068746D6C20737472696E670A20202020636F6E737420636F6D7061726564537472696E6773203D20746869732E636F6D70617265537472696E6773280A202020202020737472696E67732C';
wwv_flow_imp.g_varchar2_table(9) := '0A202020202020636F6D706172654D6F64652C0A202020202020726F74617465436F6C6F72732C0A20202020293B0A0A202020202F2F2072656E6465722068746D6C0A20202020746869732E6469762E696E6E657248544D4C203D20603C646976207374';
wwv_flow_imp.g_varchar2_table(10) := '796C653D22666F6E742D66616D696C793A2075692D6D6F6E6F73706163652C2053464D6F6E6F2D526567756C61722C204D656E6C6F2C204D6F6E61636F2C20436F6E736F6C61732C20274C696265726174696F6E204D6F6E6F272C2027436F7572696572';
wwv_flow_imp.g_varchar2_table(11) := '204E6577272C206D6F6E6F73706163653B223E0A20202020247B636F6D7061726564537472696E67732E6D6170282873747229203D3E20603C6469763E247B7374727D3C2F6469763E60292E6A6F696E282727297D0A202020203C2F6469763E603B0A20';
wwv_flow_imp.g_varchar2_table(12) := '207D0A0A2020676574496E707574537472696E677328736570617261746F724368617229207B0A20202020636F6E73742064617461456C73203D2041727261792E66726F6D28746869732E717565727953656C6563746F72416C6C282764617461272929';
wwv_flow_imp.g_varchar2_table(13) := '3B0A20202020636F6E737420737472696E6773203D205B5D3B0A0A2020202064617461456C732E666F72456163682828656C29203D3E207B0A20202020202069662028736570617261746F724368617229207B0A2020202020202020737472696E67732E';
wwv_flow_imp.g_varchar2_table(14) := '70757368282E2E2E656C2E74657874436F6E74656E742E73706C697428736570617261746F724368617229293B0A2020202020207D20656C7365207B0A2020202020202020737472696E67732E7075736828656C2E74657874436F6E74656E74293B0A20';
wwv_flow_imp.g_varchar2_table(15) := '20202020207D0A202020207D293B0A0A2020202072657475726E20737472696E67733B0A20207D0A0A20202F2F2065736C696E742D64697361626C652D6E6578742D6C696E6520636C6173732D6D6574686F64732D7573652D746869730A2020636F6D70';
wwv_flow_imp.g_varchar2_table(16) := '617265537472696E677328737472696E67732C20636F6D706172654D6F64652C20726F74617465436F6C6F727329207B0A20202020636F6E737420686967686C696768746564537472696E6773203D205B5D3B0A0A20202020737472696E67732E666F72';
wwv_flow_imp.g_varchar2_table(17) := '4561636828287374722C20696E64657829203D3E207B0A20202020202069662028696E646578203D3D3D203029207B0A2020202020202020686967686C696768746564537472696E67732E7075736828737472293B0A202020202020202072657475726E';
wwv_flow_imp.g_varchar2_table(18) := '3B0A2020202020207D0A0A202020202020636F6E7374207265666572656E6365203D0A2020202020202020636F6D706172654D6F6465203D3D3D202770726576696F75732D6C696E6527203F20737472696E67735B696E646578202D20315D203A207374';
wwv_flow_imp.g_varchar2_table(19) := '72696E67735B305D3B0A2020202020206C657420686967686C696768746564537472203D2027273B0A0A202020202020636F6E7374206D6178203D204D6174682E6D6178287374722E6C656E6774682C207265666572656E63652E6C656E677468293B0A';
wwv_flow_imp.g_varchar2_table(20) := '0A202020202020666F7220286C65742069203D20303B2069203C206D61783B2069202B3D203129207B0A2020202020202020636F6E737420686967686C69676874436F6C6F72203D20726F74617465436F6C6F7273203F2028696E646578202520362920';
wwv_flow_imp.g_varchar2_table(21) := '2B2031202A2032203A206E756C6C3B0A2020202020202020636F6E737420686967686C696768745374796C65203D20686967686C69676874436F6C6F720A202020202020202020203F20607374796C653D226261636B67726F756E643A20766172282D2D';
wwv_flow_imp.g_varchar2_table(22) := '752D636F6C6F722D247B686967686C69676874436F6C6F727D293B20636F6C6F723A20766172282D2D752D636F6C6F722D247B686967686C69676874436F6C6F727D2D636F6E7472617374293B22600A202020202020202020203A2027273B0A0A202020';
wwv_flow_imp.g_varchar2_table(23) := '202020202069662028217374725B695D29207B0A20202020202020202020686967686C696768746564537472202B3D20603C6D61726B20247B686967686C696768745374796C657D203E266E6273703B3C2F6D61726B3E603B0A20202020202020207D20';
wwv_flow_imp.g_varchar2_table(24) := '656C736520696620287374725B695D20213D3D207265666572656E63655B695D29207B0A20202020202020202020686967686C696768746564537472202B3D20603C6D61726B20247B686967686C696768745374796C657D203E247B7374725B695D7D3C';
wwv_flow_imp.g_varchar2_table(25) := '2F6D61726B3E603B0A20202020202020207D20656C7365207B0A20202020202020202020686967686C696768746564537472202B3D207374725B695D3B0A20202020202020207D0A2020202020207D0A0A202020202020686967686C6967687465645374';
wwv_flow_imp.g_varchar2_table(26) := '72696E67732E7075736828686967686C696768746564537472293B0A202020207D293B0A0A2020202072657475726E20686967686C696768746564537472696E67733B0A20207D0A7D0A0A6966202821637573746F6D456C656D656E74732E6765742827';
wwv_flow_imp.g_varchar2_table(27) := '782D7374722D636F6D706172652D7463272929207B0A2020637573746F6D456C656D656E74732E646566696E652827782D7374722D636F6D706172652D7463272C20537472436F6D706172655463293B0A7D0A0A2F2A2A2A2A2A2A2F207D2928290A3B';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(74863615479199827297)
,p_plugin_id=>wwv_flow_imp.id(74863371235759053245)
,p_file_name=>'index.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2828293D3E7B636C617373207420657874656E64732048544D4C456C656D656E747B636F6E7374727563746F7228297B737570657228292C746869732E736861646F773D746869732E617474616368536861646F77287B6D6F64653A226F70656E227D29';
wwv_flow_imp.g_varchar2_table(2) := '2C746869732E6469763D646F63756D656E742E637265617465456C656D656E74282264697622292C746869732E736861646F772E617070656E644368696C6428746869732E646976297D636F6E6E656374656443616C6C6261636B28297B746869732E72';
wwv_flow_imp.g_varchar2_table(3) := '656E64657228297D72656E64657228297B636F6E737420743D746869732E6765744174747269627574652822636F6D706172652D6D6F646522297C7C2266697273742D6C696E65222C653D2274727565223D3D3D746869732E6765744174747269627574';
wwv_flow_imp.g_varchar2_table(4) := '652822726F746174652D636F6C6F727322292C6F3D746869732E6765744174747269627574652822736570617261746F722D6368617222297C7C22222C723D746869732E676574496E707574537472696E6773286F292C6E3D746869732E636F6D706172';
wwv_flow_imp.g_varchar2_table(5) := '65537472696E677328722C742C65293B746869732E6469762E696E6E657248544D4C3D603C646976207374796C653D22666F6E742D66616D696C793A2075692D6D6F6E6F73706163652C2053464D6F6E6F2D526567756C61722C204D656E6C6F2C204D6F';
wwv_flow_imp.g_varchar2_table(6) := '6E61636F2C20436F6E736F6C61732C20274C696265726174696F6E204D6F6E6F272C2027436F7572696572204E6577272C206D6F6E6F73706163653B223E5C6E20202020247B6E2E6D61702828743D3E603C6469763E247B747D3C2F6469763E6029292E';
wwv_flow_imp.g_varchar2_table(7) := '6A6F696E282222297D5C6E202020203C2F6469763E607D676574496E707574537472696E67732874297B636F6E737420653D41727261792E66726F6D28746869732E717565727953656C6563746F72416C6C2822646174612229292C6F3D5B5D3B726574';
wwv_flow_imp.g_varchar2_table(8) := '75726E20652E666F72456163682828653D3E7B743F6F2E70757368282E2E2E652E74657874436F6E74656E742E73706C6974287429293A6F2E7075736828652E74657874436F6E74656E74297D29292C6F7D636F6D70617265537472696E677328742C65';
wwv_flow_imp.g_varchar2_table(9) := '2C6F297B636F6E737420723D5B5D3B72657475726E20742E666F72456163682828286E2C73293D3E7B696628303D3D3D732972657475726E20766F696420722E70757368286E293B636F6E737420693D2270726576696F75732D6C696E65223D3D3D653F';
wwv_flow_imp.g_varchar2_table(10) := '745B732D315D3A745B305D3B6C657420613D22223B636F6E737420633D4D6174682E6D6178286E2E6C656E6774682C692E6C656E677468293B666F72286C657420743D303B743C633B742B3D31297B636F6E737420653D6F3F7325362B323A6E756C6C2C';
wwv_flow_imp.g_varchar2_table(11) := '723D653F607374796C653D226261636B67726F756E643A20766172282D2D752D636F6C6F722D247B657D293B20636F6C6F723A20766172282D2D752D636F6C6F722D247B657D2D636F6E7472617374293B22603A22223B6E5B745D3F6E5B745D213D3D69';
wwv_flow_imp.g_varchar2_table(12) := '5B745D3F612B3D603C6D61726B20247B727D203E247B6E5B745D7D3C2F6D61726B3E603A612B3D6E5B745D3A612B3D603C6D61726B20247B727D203E266E6273703B3C2F6D61726B3E607D722E707573682861297D29292C727D7D637573746F6D456C65';
wwv_flow_imp.g_varchar2_table(13) := '6D656E74732E6765742822782D7374722D636F6D706172652D746322297C7C637573746F6D456C656D656E74732E646566696E652822782D7374722D636F6D706172652D7463222C74297D2928293B';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(74863615713099827299)
,p_plugin_id=>wwv_flow_imp.id(74863371235759053245)
,p_file_name=>'index.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
