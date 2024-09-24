;; Test 2: Use a loop within a function, which repeatedly calls another function with a `call` instruction. Use `br_if` within the loop body to break from the loop based on the loop counter's condition.

(assert_invalid
  (module
    (func $inner (param i32) (result i32)
      local.get 0
      i32.const 1
      i32.add
    )
    (func $outer (param i32) (result i32)
      (local i32)
      local.get 0
      loop $loop
        call $inner
        local.set 1
        local.get 0
        i32.const 1
        i32.sub
        local.tee 0
        br_if $loop
      end
      local.get 1
    )
    (start $outer)
  )
  "type mismatch"
)