;; Test 3: Implement a sequence of `local.set` and `local.get` operations between multiple `br_table` instructions with varying label vectors. Assess for stack mismatches and flooding from improper type and operand tracking within the stack frame during branching operations.

(assert_invalid
  (module
    (func $local-set-get-br_table
      (local $var i32)
      (local.set $var (i32.const 5))
      (block $block0 (result i32)
        (local.get $var)
        (i32.add (local.get $var) (i32.const 1))
        (block $block1 (result i32)
          (local.get $var)
          (br_table 0 ($block0) ($block1) (i32.const 0))
        )
        (i32.const 1)
      )
    )
  )
  "stack mismatch"
)