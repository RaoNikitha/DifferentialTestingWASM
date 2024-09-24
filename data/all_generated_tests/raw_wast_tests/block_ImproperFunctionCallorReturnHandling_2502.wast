;; 3. Test Description: Develop a block with nested blocks, each having `call` instructions to different functions with varied return types. The outer block should expect a specific return type from the nested calls. WebAssembly’s `check_block` should ensure proper stack transitions, while `wizard_engine` might not correctly handle the nested stack states.

(assert_invalid
  (module
    (func $nested-errors (result i32)
      (block (result i32)
        (block (result f32)
          (call 0) ;; Assume call returns i32
          (f32.const 1.0)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)