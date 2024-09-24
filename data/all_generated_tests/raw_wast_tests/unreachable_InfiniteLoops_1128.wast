;; 9. Create a loop containing a function call and an `unreachable` instruction placed directly after the call. The function itself attempts to modify a loop control variable. This tests whether an `unreachable` in the main loop correctly overrides any modifications by the function, stopping the loop.

(assert_invalid
  (module
    (func $modify (param $var i32) (result i32)
      local.get $var
      i32.const 1
      i32.add)
    (func $loop_with_unreachable
      (local $i i32)
      i32.const 0
      local.set $i
      (loop $loop
        call $modify
        local.get $i
        local.set $i
        unreachable
        br $loop))
  )
  "type mismatch"
)