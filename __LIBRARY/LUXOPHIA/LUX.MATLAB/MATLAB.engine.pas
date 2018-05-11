unit MATLAB.engine;

(*
 * Copyright 1984-2017 The MathWorks, Inc.
 *)

interface //#################################################################### ■

uses LUX.Code.C;

//#if defined(_MSC_VER)
//# pragma once
//#endif
//#if defined(__GNUC__) && (__GNUC__ > 3 || (__GNUC__ == 3 && __GNUC_MINOR__ > 3))
//# pragma once
//#endif

//#ifndef PUBLISHED_EXTERN_API_HPP
//#define PUBLISHED_EXTERN_API_HPP

//#if defined(BUILDING_LIBENG)
// #define LIBMWENGINE_PUBLISHED_API DLL_EXPORT_SYM
//#else
// #define LIBMWENGINE_PUBLISHED_API
//#endif

//#ifndef EXTERN_C
// #ifdef __cplusplus
//  #define EXTERN_C extern "C"
// #else
//  #define EXTERN_C extern
// #endif
//#endif

//#ifndef LIBMWENGINE_PUBLISHED_API_EXTERN_C
// #define LIBMWENGINE_PUBLISHED_API_EXTERN_C EXTERN_C LIBMWENGINE_PUBLISHED_API
//#endif

//#include "matrix.h"

type TEngine = record end;
     PEngine = ^TEngine;

(* Execute matlab statement *)
function engEvalString( ep_:PEngine; const string_:P_char ) :T_int;

(* Start matlab process for single use.
   Not currently supported on UNIX. *)
function engOpenSingleUse( const startcmd_:P_char; reserved_:P_void; retstatus_:P_int ) :PEngine;

(* SetVisible, do nothing since this function is only for NT  *)
function engSetVisible( ep_:PEngine; newVal_:T_bool ) :T_int;

(* GetVisible, do nothing since this function is only for NT *)
function engGetVisible( ep_:PEngine; bVal_:P_bool ) :T_int;

(* Start matlab process *)
function engOpen( const startcmd_:P_char ) :PEngine;

(* Close down matlab server *)
function engClose( ep_:PEngine ) :T_int;

(* Get a variable with the specified name from MATLAB's workspace *)
function engGetVariable( ep_:PEngine; const name_:P_char ) :P_mxArray;

(* Put a variable into MATLAB's workspace with the specified name *)
function engPutVariable( ep_:PEngine; const var_name_:P_char; const ap_:P_mxArray ) :T_int;

(* register a buffer to hold matlab text output *)
function engOutputBuffer( ep_:PEngine; buffer_:P_char; buflen_:T_int ) :T_int;

end. //######################################################################### ■
