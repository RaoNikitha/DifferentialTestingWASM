;; 8. Design a test using a combination of `loop` and memory operations (`load`/`store`) with varying sizes and offsets. Test the correct stack balancing post memory operations while looping and relabeling.

(assert_invalid
  (module
    (memory $0 1)
    (func $test_loop_memory
      (loop $loop_label
        (i32.const 0)
        (i32.const 1)
        (i32.store)
        (i32.const 0)
        (i32.load offset=1)
        (br $loop_label)
      )
    )
  )
  "type mismatch"
)