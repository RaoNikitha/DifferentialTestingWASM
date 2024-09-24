;; 3. **Test 3**: Use `nop` within a loop that executes several `call` instructions to different functions. Verify the loop execution and ensure that function returns are handled correctly without being affected by `nop`.

(assert_invalid
  (module
    (func $test-loop-nop
      (loop $loop
        nop
        call $dummy1
        call $dummy2
        call $dummy3
        br $loop
      )
    )
    (func $dummy1)
    (func $dummy2)
    (func $dummy3)
  )
  "type mismatch"
)