;; 9. **Test Description**: Implement nested `block` instructions where each block performs a unique operation and a branch instruction attempts to skip several layers at once. Verify if both implementations consistently identify the correct block target for the long-distance branch.

(assert_invalid
  (module (func $nested-blocks-with-branch (param i32) (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (br 2)
          (i32.const 1)
        )
        (i32.const 2)
      )
      (i32.const 3)
    )
  ))
  "type mismatch"
)