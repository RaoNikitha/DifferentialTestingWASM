;; 7. Develop a test with multiple `block` and `loop` levels where the inner `block` contains a `br_if` targeting a depth that is incorrectly calculated. This should reveal incorrect implementations where the branch does not reach the expected block.

(assert_invalid
  (module
    (func $invalid-br-depth (result i32)
      (block (result i32)
        (i32.const 42)
        (block
          (loop
            (br_if 3 (i32.const 1)) ;; incorrect depth
          )
        )
      )
    )
  )
  "unknown label"
)