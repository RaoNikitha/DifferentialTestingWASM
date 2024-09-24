;; 7. Establish a complex block structure with mixed `br` and `br_if` instructions and a `blocktype` that causes mismatched label indexing, followed by an unreachable instruction to catch unwarranted jumps.

(assert_invalid
  (module (func $complex-block-test (result i32)
    (block (result i32)
      (block (result i32) (br_if 0 (i32.const 1)))
      (br 1)
      (unreachable)
    )
    (i32.const 0)
  ))
  "mismatching label index"
)