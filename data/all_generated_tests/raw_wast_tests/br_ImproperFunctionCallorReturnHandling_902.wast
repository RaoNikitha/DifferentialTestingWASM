;; 3. **Recursive Function with Br Instruction:**    Create a function that calls itself recursively and includes a `br` instruction inside a nested block. This tests the correct function call and return handling in the presence of both recursion and branching.

(assert_invalid
  (module
    (func $recursive (param i32) (result i32)
      (local i32)
      (block $outer (result i32)
        (block $inner (result i32)
          (local.set 1 (i32.const 1))
          (br_if $inner (i32.eqz (local.get 0)))
          (local.set 0 (i32.sub (local.get 0) (i32.const 1)))
          (call $recursive (local.get 0))
          (br $outer)
        )
        (nop)
      )
      (local.get 1)
    )
    (func (export "main") (result i32)
      (call $recursive (i32.const 1))
    )
  )
  "unknown label"
)