;; 2. **Block with Call-Indirect**: Test a `block` that contains a `call_indirect` instruction, checking if the block context correctly handles type indices and indirect table lookups.    ```    block $block2      call_indirect (type $typeidx)    end    ```

(assert_invalid
  (module 
    (type $typeidx (func))
    (table 1 funcref)
    (func $test-block-call-indirect 
      (block (result i32)
        (call_indirect (type $typeidx))
      )
    )
  )
  "type mismatch"
)