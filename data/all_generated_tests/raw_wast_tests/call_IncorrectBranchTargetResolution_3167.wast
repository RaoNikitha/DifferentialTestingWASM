;; 6. **Test Description**: Call a function that iterates using a loop and includes a branch (`br`) targeting the loop start incorrectly. Validate if it returns the correct branch target.    - **Constraint**: Checks whether loops are correctly re-entered from a `br` instruction within nested function calls.

(assert_invalid
  (module
    (type $type-loop (func (param i32) (result i32)))
    (func $loop-func (type $type-loop) (param $p i32) (result i32)
      local.get $p
      i32.const 10
      i32.eq
      (loop $outer
        local.get $p
        i32.const 1
        i32.sub
        local.set $p
        local.get $p
        i32.const 0
        i32.eq
        br_if $outer
        local.get $p
      )
    )
    (func $main (result i32)
      i32.const 5
      call $loop-func
    )
  )
  "branch not found"
)