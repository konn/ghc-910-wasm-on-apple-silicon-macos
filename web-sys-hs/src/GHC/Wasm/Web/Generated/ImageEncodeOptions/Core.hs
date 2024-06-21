{-# OPTIONS_GHC -Wno-all #-}
{-# LANGUAGE GHC2021 #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE StandaloneKindSignatures #-}
{-# LANGUAGE UnliftedDatatypes #-}
{-# LANGUAGE UnliftedNewtypes #-}
{-# LANGUAGE TypeData #-}
module GHC.Wasm.Web.Generated.ImageEncodeOptions.Core (
        ImageEncodeOptionsFields, ImageEncodeOptionsClass,
        ImageEncodeOptions, ReifiedImageEncodeOptions
    ) where
import Data.Int
import Data.Word
import Foreign.C.Types
import GHC.Wasm.Object.Builtins
import GHC.Wasm.Web.Types
type ImageEncodeOptionsFields =
    '[ '("quality", NullableClass (JSPrimClass Double)),
       '("type", NullableClass DOMStringClass)]
type ImageEncodeOptionsClass =
    JSDictionaryClass ImageEncodeOptionsFields
type ImageEncodeOptions = JSObject ImageEncodeOptionsClass
type ReifiedImageEncodeOptions =
    ReifiedDictionary ImageEncodeOptionsFields
