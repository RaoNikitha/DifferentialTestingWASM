;; Test 7: Compose a module with `block` constructs containing multiple branching paths using conditional branches. Incorporate function calls within these blocks where branch instructions could mistakenly target a neighboring label in different implementations.

(assert_invalid
  (module
    (func $cond_call
      (block $label1
        (call $some_func)
        (br_if $label1 (i32.const 0))
        (block $label2
          (call $other_func)
          (br_if $label2 (i32.const 1))
        )
      )
    )
    (func $some_func)
    (func $other_func)
  )
  "unknown function type"
)