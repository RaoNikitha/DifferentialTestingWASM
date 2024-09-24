;; 4. **Test Description**: A deep nesting of interleaved `loop` and `block` instructions, followed by `br_table` in the innermost block indexing across multiple blocks.    - **Constraint Checked**: Validates nested structure indices and the correct handling of indirect branches.    - **Relation to Mismanagement of Block Nesting**: Implementation may fail to resolve the correct jump targets within nested structures.

(assert_invalid
  (module
    (func $deep-nesting
      (loop (param i32) (block (loop (block (loop (block (loop (result i32)
        (br_table 0 1 2 3 (i32.const 1))
      ))))))
    ))
  )
  "type mismatch"
)