;; Test 10: Place multiple `nop` instructions before a series of `br_if` statements in a sequence of `if` structures. Ensure that each `br_if` correctly resolves its target branch, ignoring the presence of `nop` and maintaining proper control flow.

(assert_invalid
  (module
    (func $test 
      (block $label1
        nop
        nop
        if (i32.const 1)
          (br_if $label1 (i32.const 0))
        end
        (br_if $label1 (i32.const 0))
      )
    )
  )
  "type mismatch"
)