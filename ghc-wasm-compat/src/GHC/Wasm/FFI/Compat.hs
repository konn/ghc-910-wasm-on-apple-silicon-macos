{-# LANGUAGE CPP #-}
{-# LANGUAGE TemplateHaskell #-}

module GHC.Wasm.FFI.Compat (foreignImportJS, foreignExportJS) where

import GHC.Stack (HasCallStack)
import GHC.Wasm.Compat.Flags
import Language.Haskell.TH

foreignImportJS :: Safety -> String -> String -> TypeQ -> DecsQ
foreignImportJS safety code name typ = do
  let funName = mkName name
  dec <- ForeignD . ImportF JavaScript safety code funName <$> typ
  if isWasmBackend
    then pure [dec]
    else do
      let decShown = pprint dec
      sequenceA
        [ sigD funName [t|(HasCallStack) => $typ|]
        , funD
            funName
            [ clause
                []
                ( normalB $
                    unTypeCode
                      [||error $ "foreignImportJS: " ++ decShown||]
                )
                []
            ]
        ]

foreignExportJS :: String -> String -> TypeQ -> DecsQ
foreignExportJS code name typ = do
  let funName = mkName name
  dec <- ForeignD . ExportF JavaScript code funName <$> typ
  if isWasmBackend
    then pure [dec]
    else do
      let decShown = pprint dec
      sequenceA
        [ sigD funName [t|(HasCallStack) => $typ|]
        , funD
            funName
            [ clause
                []
                ( normalB $
                    unTypeCode
                      [||error $ "foreignImportJS: " ++ decShown||]
                )
                []
            ]
        ]
