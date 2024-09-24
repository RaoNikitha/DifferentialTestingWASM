;; 8. **Complex Loop with Embedded Block**: Develop a loop that includes an embedded `block` instruction which in turn contains several branches conditional and unconditional. Test if branching across different block types inside a loop is handled accurately, ensuring the nested labels are interpreted correctly.

(assert_invalid
  (module (func $complex-loop-with-embedded-block
    (loop (result i32)
      (block (result i32)
        (br_if 0 (i32.const 1))
        (br 1)
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)