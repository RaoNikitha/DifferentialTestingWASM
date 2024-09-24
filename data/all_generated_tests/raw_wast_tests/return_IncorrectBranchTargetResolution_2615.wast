;; 4. Test Description: Construct a function featuring a complex control flow with nested blocks containing breaks (br). Place a return instruction within the innermost block and validate that the instruction correctly exits the outermost function, disregarding intermediate breaks. This checks for accurate block target resolution.

(assert_invalid
  (module
    (func $complex-control-flow (result i32)
      (i32.const 0)
      (block
        (block
          (block
            (br 2)
            (return)
          )
          (return)
        )
      )
    )
  )
  "type mismatch"
)