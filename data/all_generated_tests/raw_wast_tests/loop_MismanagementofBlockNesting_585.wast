;; Nest multiple blocks inside a loop and use overlapping `br` and `br_if` instructions to branch out of different contexts. WebAssembly should manage the stack and labels correctly, but Wizard Engine might branch inaccurately to the wrong depth.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (block (result i32)
          (block (result i32)
            (i32.const 1)
            (br_if 1 (i32.const 0))
          )
          (i32.const 2)
        )
      )
    )
  )
  "type mismatch"
)