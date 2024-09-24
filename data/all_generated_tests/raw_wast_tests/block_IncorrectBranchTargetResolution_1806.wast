;; 7. **Test Block with Exceeding Label Depth in `br`**:    - Embed multiple nested blocks with a `br` instruction referencing a depth exceeding available labels.    - This verifies if branch depth checks correctly prevent invalid jumps.    - Expected result: WebAssembly should detect the invalid depth, while wizard_engine might fail silently.

(assert_invalid
  (module
    (func $exceeding-label-depth
      (block (result i32)
        (i32.const 42)
        (block (block (block 
          (br 4)))))))
  "unknown label"
)