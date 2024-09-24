;; 5. **Br Within Function Called Indirectly:**    - Include a `call_indirect` instruction to invoke a function containing multiple labels and a `br` instruction. Ensure that the branch correctly references the appropriate label index and behaves as expected when the function is invoked indirectly.

(assert_invalid
  (module
    (type $t (func))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $target (result i32)
      (block (block (block
        (call_indirect (type $t) (i32.const 0))
        (br 2)
      )))
    )
  )
  "type mismatch"
)