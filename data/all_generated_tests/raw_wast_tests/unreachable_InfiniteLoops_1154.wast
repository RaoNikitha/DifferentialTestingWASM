;; 5. Implement a function with an infinite loop that conditionally uses `br` based on a counter. Inside the loop, place an `unreachable` before the `br` and check if the loop is broken correctly or results in a trap.

(assert_invalid
  (module
    (func $infinite-loop-unreachable
      (local $counter i32)
      loop
        (i32.eqz (local.get $counter))
        if
          unreachable
          br 1
        end
        (local.set $counter (i32.sub (local.get $counter) (i32.const 1)))
        br 0
      end
    )
  )
  "type mismatch"
)