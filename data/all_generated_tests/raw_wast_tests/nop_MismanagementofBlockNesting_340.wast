;; 1. **Test Nested Block with Nop**: Create a WebAssembly function that contains a nested block structure with `nop` instructions at the beginning and end of each block. This test checks if the `nop` instructions within nested blocks are correctly ignored, and control flow continues to the correct block boundaries.

(assert_invalid
  (module (func (block (nop) (block (nop) (nop) (end) (nop)) (nop) (end) (nop)))
  "invalid block end"
))