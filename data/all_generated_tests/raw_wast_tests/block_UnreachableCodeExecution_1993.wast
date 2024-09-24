;; 4. Set up a block with `typeidx` producing a value. Inside this block, initiate a nested block that uses `br` to incorrectly exit to an `unreachable` code path. Verify that the block ends correctly without executing unreachable code.

(assert_invalid
  (module 
    (type $t (func (result i32)))
    (func $typeidx-unreachable (result i32)
      (block $outer (type $t)
        (block $inner (result i32) 
          (br 1 (unreachable))
        )
        (i32.const 42)
      )
    )
  )
  "type mismatch"
)