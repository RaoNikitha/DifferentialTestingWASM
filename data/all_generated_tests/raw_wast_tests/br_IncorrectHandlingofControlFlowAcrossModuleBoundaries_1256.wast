;; 7. **Test Description:**    Develop an imported function that contains nested `block` and `loop` constructs, with `br` instructions targeting these constructs. Call this function from a module and ensure the branches are correctly interpreted, keeping the stack and control flow in sync.

(assert_invalid
  (module
    (func $nested-block-loop-br
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (br 1)
          )
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)