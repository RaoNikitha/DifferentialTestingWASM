;; 3. **Test Description:**    Use an exported function from a module that includes an `unreachable` instruction inside a nested block. Call this function from another module and observe if execution halts immediately with a trap in both implementations.

(assert_invalid
 (module
  (func $nested-block-unreachable
   (block
    (block
     (unreachable)
     (i32.const 0)
    )
   )
  )
  (export "test" (func $nested-block-unreachable))
 )
 "type mismatch"
)