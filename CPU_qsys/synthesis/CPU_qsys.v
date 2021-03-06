// CPU_qsys.v

// Generated using ACDS version 13.1 162 at 2018.01.23.14:20:37

`timescale 1 ps / 1 ps
module CPU_qsys (
		input  wire        clk_clk,             //           clk.clk
		input  wire        reset_reset_n,       //         reset.reset_n
		output wire [12:0] sdram_conduit_addr,  // sdram_conduit.addr
		output wire [1:0]  sdram_conduit_ba,    //              .ba
		output wire        sdram_conduit_cas_n, //              .cas_n
		output wire        sdram_conduit_cke,   //              .cke
		output wire        sdram_conduit_cs_n,  //              .cs_n
		inout  wire [15:0] sdram_conduit_dq,    //              .dq
		output wire [1:0]  sdram_conduit_dqm,   //              .dqm
		output wire        sdram_conduit_ras_n, //              .ras_n
		output wire        sdram_conduit_we_n,  //              .we_n
		input  wire        uart_conduit_rxd,    //  uart_conduit.rxd
		output wire        uart_conduit_txd     //              .txd
	);

	wire         cpu_data_master_waitrequest;                               // mm_interconnect_0:CPU_data_master_waitrequest -> CPU:d_waitrequest
	wire  [31:0] cpu_data_master_writedata;                                 // CPU:d_writedata -> mm_interconnect_0:CPU_data_master_writedata
	wire  [26:0] cpu_data_master_address;                                   // CPU:d_address -> mm_interconnect_0:CPU_data_master_address
	wire         cpu_data_master_write;                                     // CPU:d_write -> mm_interconnect_0:CPU_data_master_write
	wire         cpu_data_master_read;                                      // CPU:d_read -> mm_interconnect_0:CPU_data_master_read
	wire  [31:0] cpu_data_master_readdata;                                  // mm_interconnect_0:CPU_data_master_readdata -> CPU:d_readdata
	wire         cpu_data_master_debugaccess;                               // CPU:jtag_debug_module_debugaccess_to_roms -> mm_interconnect_0:CPU_data_master_debugaccess
	wire         cpu_data_master_readdatavalid;                             // mm_interconnect_0:CPU_data_master_readdatavalid -> CPU:d_readdatavalid
	wire   [3:0] cpu_data_master_byteenable;                                // CPU:d_byteenable -> mm_interconnect_0:CPU_data_master_byteenable
	wire  [15:0] mm_interconnect_0_uart_s1_writedata;                       // mm_interconnect_0:UART_s1_writedata -> UART:writedata
	wire   [2:0] mm_interconnect_0_uart_s1_address;                         // mm_interconnect_0:UART_s1_address -> UART:address
	wire         mm_interconnect_0_uart_s1_chipselect;                      // mm_interconnect_0:UART_s1_chipselect -> UART:chipselect
	wire         mm_interconnect_0_uart_s1_write;                           // mm_interconnect_0:UART_s1_write -> UART:write_n
	wire         mm_interconnect_0_uart_s1_read;                            // mm_interconnect_0:UART_s1_read -> UART:read_n
	wire  [15:0] mm_interconnect_0_uart_s1_readdata;                        // UART:readdata -> mm_interconnect_0:UART_s1_readdata
	wire         mm_interconnect_0_uart_s1_begintransfer;                   // mm_interconnect_0:UART_s1_begintransfer -> UART:begintransfer
	wire         cpu_instruction_master_waitrequest;                        // mm_interconnect_0:CPU_instruction_master_waitrequest -> CPU:i_waitrequest
	wire  [26:0] cpu_instruction_master_address;                            // CPU:i_address -> mm_interconnect_0:CPU_instruction_master_address
	wire         cpu_instruction_master_read;                               // CPU:i_read -> mm_interconnect_0:CPU_instruction_master_read
	wire  [31:0] cpu_instruction_master_readdata;                           // mm_interconnect_0:CPU_instruction_master_readdata -> CPU:i_readdata
	wire         cpu_instruction_master_readdatavalid;                      // mm_interconnect_0:CPU_instruction_master_readdatavalid -> CPU:i_readdatavalid
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest; // JTAG_UART:av_waitrequest -> mm_interconnect_0:JTAG_UART_avalon_jtag_slave_waitrequest
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata;   // mm_interconnect_0:JTAG_UART_avalon_jtag_slave_writedata -> JTAG_UART:av_writedata
	wire   [0:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_address;     // mm_interconnect_0:JTAG_UART_avalon_jtag_slave_address -> JTAG_UART:av_address
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect;  // mm_interconnect_0:JTAG_UART_avalon_jtag_slave_chipselect -> JTAG_UART:av_chipselect
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_write;       // mm_interconnect_0:JTAG_UART_avalon_jtag_slave_write -> JTAG_UART:av_write_n
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_read;        // mm_interconnect_0:JTAG_UART_avalon_jtag_slave_read -> JTAG_UART:av_read_n
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata;    // JTAG_UART:av_readdata -> mm_interconnect_0:JTAG_UART_avalon_jtag_slave_readdata
	wire   [0:0] mm_interconnect_0_sysid_qsys_control_slave_address;        // mm_interconnect_0:sysid_qsys_control_slave_address -> sysid_qsys:address
	wire  [31:0] mm_interconnect_0_sysid_qsys_control_slave_readdata;       // sysid_qsys:readdata -> mm_interconnect_0:sysid_qsys_control_slave_readdata
	wire         mm_interconnect_0_cpu_jtag_debug_module_waitrequest;       // CPU:jtag_debug_module_waitrequest -> mm_interconnect_0:CPU_jtag_debug_module_waitrequest
	wire  [31:0] mm_interconnect_0_cpu_jtag_debug_module_writedata;         // mm_interconnect_0:CPU_jtag_debug_module_writedata -> CPU:jtag_debug_module_writedata
	wire   [8:0] mm_interconnect_0_cpu_jtag_debug_module_address;           // mm_interconnect_0:CPU_jtag_debug_module_address -> CPU:jtag_debug_module_address
	wire         mm_interconnect_0_cpu_jtag_debug_module_write;             // mm_interconnect_0:CPU_jtag_debug_module_write -> CPU:jtag_debug_module_write
	wire         mm_interconnect_0_cpu_jtag_debug_module_read;              // mm_interconnect_0:CPU_jtag_debug_module_read -> CPU:jtag_debug_module_read
	wire  [31:0] mm_interconnect_0_cpu_jtag_debug_module_readdata;          // CPU:jtag_debug_module_readdata -> mm_interconnect_0:CPU_jtag_debug_module_readdata
	wire         mm_interconnect_0_cpu_jtag_debug_module_debugaccess;       // mm_interconnect_0:CPU_jtag_debug_module_debugaccess -> CPU:jtag_debug_module_debugaccess
	wire   [3:0] mm_interconnect_0_cpu_jtag_debug_module_byteenable;        // mm_interconnect_0:CPU_jtag_debug_module_byteenable -> CPU:jtag_debug_module_byteenable
	wire         mm_interconnect_0_sdram_s1_waitrequest;                    // SDRAM:za_waitrequest -> mm_interconnect_0:SDRAM_s1_waitrequest
	wire  [15:0] mm_interconnect_0_sdram_s1_writedata;                      // mm_interconnect_0:SDRAM_s1_writedata -> SDRAM:az_data
	wire  [23:0] mm_interconnect_0_sdram_s1_address;                        // mm_interconnect_0:SDRAM_s1_address -> SDRAM:az_addr
	wire         mm_interconnect_0_sdram_s1_chipselect;                     // mm_interconnect_0:SDRAM_s1_chipselect -> SDRAM:az_cs
	wire         mm_interconnect_0_sdram_s1_write;                          // mm_interconnect_0:SDRAM_s1_write -> SDRAM:az_wr_n
	wire         mm_interconnect_0_sdram_s1_read;                           // mm_interconnect_0:SDRAM_s1_read -> SDRAM:az_rd_n
	wire  [15:0] mm_interconnect_0_sdram_s1_readdata;                       // SDRAM:za_data -> mm_interconnect_0:SDRAM_s1_readdata
	wire         mm_interconnect_0_sdram_s1_readdatavalid;                  // SDRAM:za_valid -> mm_interconnect_0:SDRAM_s1_readdatavalid
	wire   [1:0] mm_interconnect_0_sdram_s1_byteenable;                     // mm_interconnect_0:SDRAM_s1_byteenable -> SDRAM:az_be_n
	wire         irq_mapper_receiver0_irq;                                  // UART:irq -> irq_mapper:receiver0_irq
	wire         irq_mapper_receiver1_irq;                                  // JTAG_UART:av_irq -> irq_mapper:receiver1_irq
	wire  [31:0] cpu_d_irq_irq;                                             // irq_mapper:sender_irq -> CPU:d_irq
	wire         rst_controller_reset_out_reset;                            // rst_controller:reset_out -> [CPU:reset_n, JTAG_UART:rst_n, SDRAM:reset_n, UART:reset_n, irq_mapper:reset, mm_interconnect_0:CPU_reset_n_reset_bridge_in_reset_reset, rst_translator:in_reset, sysid_qsys:reset_n]
	wire         rst_controller_reset_out_reset_req;                        // rst_controller:reset_req -> [CPU:reset_req, rst_translator:reset_req_in]
	wire         cpu_jtag_debug_module_reset_reset;                         // CPU:jtag_debug_module_resetrequest -> rst_controller:reset_in1

	CPU_qsys_CPU cpu (
		.clk                                   (clk_clk),                                             //                       clk.clk
		.reset_n                               (~rst_controller_reset_out_reset),                     //                   reset_n.reset_n
		.reset_req                             (rst_controller_reset_out_reset_req),                  //                          .reset_req
		.d_address                             (cpu_data_master_address),                             //               data_master.address
		.d_byteenable                          (cpu_data_master_byteenable),                          //                          .byteenable
		.d_read                                (cpu_data_master_read),                                //                          .read
		.d_readdata                            (cpu_data_master_readdata),                            //                          .readdata
		.d_waitrequest                         (cpu_data_master_waitrequest),                         //                          .waitrequest
		.d_write                               (cpu_data_master_write),                               //                          .write
		.d_writedata                           (cpu_data_master_writedata),                           //                          .writedata
		.d_readdatavalid                       (cpu_data_master_readdatavalid),                       //                          .readdatavalid
		.jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),                         //                          .debugaccess
		.i_address                             (cpu_instruction_master_address),                      //        instruction_master.address
		.i_read                                (cpu_instruction_master_read),                         //                          .read
		.i_readdata                            (cpu_instruction_master_readdata),                     //                          .readdata
		.i_waitrequest                         (cpu_instruction_master_waitrequest),                  //                          .waitrequest
		.i_readdatavalid                       (cpu_instruction_master_readdatavalid),                //                          .readdatavalid
		.d_irq                                 (cpu_d_irq_irq),                                       //                     d_irq.irq
		.jtag_debug_module_resetrequest        (cpu_jtag_debug_module_reset_reset),                   //   jtag_debug_module_reset.reset
		.jtag_debug_module_address             (mm_interconnect_0_cpu_jtag_debug_module_address),     //         jtag_debug_module.address
		.jtag_debug_module_byteenable          (mm_interconnect_0_cpu_jtag_debug_module_byteenable),  //                          .byteenable
		.jtag_debug_module_debugaccess         (mm_interconnect_0_cpu_jtag_debug_module_debugaccess), //                          .debugaccess
		.jtag_debug_module_read                (mm_interconnect_0_cpu_jtag_debug_module_read),        //                          .read
		.jtag_debug_module_readdata            (mm_interconnect_0_cpu_jtag_debug_module_readdata),    //                          .readdata
		.jtag_debug_module_waitrequest         (mm_interconnect_0_cpu_jtag_debug_module_waitrequest), //                          .waitrequest
		.jtag_debug_module_write               (mm_interconnect_0_cpu_jtag_debug_module_write),       //                          .write
		.jtag_debug_module_writedata           (mm_interconnect_0_cpu_jtag_debug_module_writedata),   //                          .writedata
		.no_ci_readra                          ()                                                     // custom_instruction_master.readra
	);

	CPU_qsys_SDRAM sdram (
		.clk            (clk_clk),                                  //   clk.clk
		.reset_n        (~rst_controller_reset_out_reset),          // reset.reset_n
		.az_addr        (mm_interconnect_0_sdram_s1_address),       //    s1.address
		.az_be_n        (~mm_interconnect_0_sdram_s1_byteenable),   //      .byteenable_n
		.az_cs          (mm_interconnect_0_sdram_s1_chipselect),    //      .chipselect
		.az_data        (mm_interconnect_0_sdram_s1_writedata),     //      .writedata
		.az_rd_n        (~mm_interconnect_0_sdram_s1_read),         //      .read_n
		.az_wr_n        (~mm_interconnect_0_sdram_s1_write),        //      .write_n
		.za_data        (mm_interconnect_0_sdram_s1_readdata),      //      .readdata
		.za_valid       (mm_interconnect_0_sdram_s1_readdatavalid), //      .readdatavalid
		.za_waitrequest (mm_interconnect_0_sdram_s1_waitrequest),   //      .waitrequest
		.zs_addr        (sdram_conduit_addr),                       //  wire.export
		.zs_ba          (sdram_conduit_ba),                         //      .export
		.zs_cas_n       (sdram_conduit_cas_n),                      //      .export
		.zs_cke         (sdram_conduit_cke),                        //      .export
		.zs_cs_n        (sdram_conduit_cs_n),                       //      .export
		.zs_dq          (sdram_conduit_dq),                         //      .export
		.zs_dqm         (sdram_conduit_dqm),                        //      .export
		.zs_ras_n       (sdram_conduit_ras_n),                      //      .export
		.zs_we_n        (sdram_conduit_we_n)                        //      .export
	);

	CPU_qsys_UART uart (
		.clk           (clk_clk),                                 //                 clk.clk
		.reset_n       (~rst_controller_reset_out_reset),         //               reset.reset_n
		.address       (mm_interconnect_0_uart_s1_address),       //                  s1.address
		.begintransfer (mm_interconnect_0_uart_s1_begintransfer), //                    .begintransfer
		.chipselect    (mm_interconnect_0_uart_s1_chipselect),    //                    .chipselect
		.read_n        (~mm_interconnect_0_uart_s1_read),         //                    .read_n
		.write_n       (~mm_interconnect_0_uart_s1_write),        //                    .write_n
		.writedata     (mm_interconnect_0_uart_s1_writedata),     //                    .writedata
		.readdata      (mm_interconnect_0_uart_s1_readdata),      //                    .readdata
		.dataavailable (),                                        //                    .dataavailable
		.readyfordata  (),                                        //                    .readyfordata
		.rxd           (uart_conduit_rxd),                        // external_connection.export
		.txd           (uart_conduit_txd),                        //                    .export
		.irq           (irq_mapper_receiver0_irq)                 //                 irq.irq
	);

	CPU_qsys_JTAG_UART jtag_uart (
		.clk            (clk_clk),                                                   //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                           //             reset.reset_n
		.av_chipselect  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //                  .address
		.av_read_n      (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),       //                  .read_n
		.av_readdata    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //                  .readdata
		.av_write_n     (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),      //                  .write_n
		.av_writedata   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //                  .writedata
		.av_waitrequest (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //                  .waitrequest
		.av_irq         (irq_mapper_receiver1_irq)                                   //               irq.irq
	);

	CPU_qsys_sysid_qsys sysid_qsys (
		.clock    (clk_clk),                                             //           clk.clk
		.reset_n  (~rst_controller_reset_out_reset),                     //         reset.reset_n
		.readdata (mm_interconnect_0_sysid_qsys_control_slave_readdata), // control_slave.readdata
		.address  (mm_interconnect_0_sysid_qsys_control_slave_address)   //              .address
	);

	CPU_qsys_mm_interconnect_0 mm_interconnect_0 (
		.CLK_clk_clk                             (clk_clk),                                                   //                           CLK_clk.clk
		.CPU_reset_n_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                            // CPU_reset_n_reset_bridge_in_reset.reset
		.CPU_data_master_address                 (cpu_data_master_address),                                   //                   CPU_data_master.address
		.CPU_data_master_waitrequest             (cpu_data_master_waitrequest),                               //                                  .waitrequest
		.CPU_data_master_byteenable              (cpu_data_master_byteenable),                                //                                  .byteenable
		.CPU_data_master_read                    (cpu_data_master_read),                                      //                                  .read
		.CPU_data_master_readdata                (cpu_data_master_readdata),                                  //                                  .readdata
		.CPU_data_master_readdatavalid           (cpu_data_master_readdatavalid),                             //                                  .readdatavalid
		.CPU_data_master_write                   (cpu_data_master_write),                                     //                                  .write
		.CPU_data_master_writedata               (cpu_data_master_writedata),                                 //                                  .writedata
		.CPU_data_master_debugaccess             (cpu_data_master_debugaccess),                               //                                  .debugaccess
		.CPU_instruction_master_address          (cpu_instruction_master_address),                            //            CPU_instruction_master.address
		.CPU_instruction_master_waitrequest      (cpu_instruction_master_waitrequest),                        //                                  .waitrequest
		.CPU_instruction_master_read             (cpu_instruction_master_read),                               //                                  .read
		.CPU_instruction_master_readdata         (cpu_instruction_master_readdata),                           //                                  .readdata
		.CPU_instruction_master_readdatavalid    (cpu_instruction_master_readdatavalid),                      //                                  .readdatavalid
		.CPU_jtag_debug_module_address           (mm_interconnect_0_cpu_jtag_debug_module_address),           //             CPU_jtag_debug_module.address
		.CPU_jtag_debug_module_write             (mm_interconnect_0_cpu_jtag_debug_module_write),             //                                  .write
		.CPU_jtag_debug_module_read              (mm_interconnect_0_cpu_jtag_debug_module_read),              //                                  .read
		.CPU_jtag_debug_module_readdata          (mm_interconnect_0_cpu_jtag_debug_module_readdata),          //                                  .readdata
		.CPU_jtag_debug_module_writedata         (mm_interconnect_0_cpu_jtag_debug_module_writedata),         //                                  .writedata
		.CPU_jtag_debug_module_byteenable        (mm_interconnect_0_cpu_jtag_debug_module_byteenable),        //                                  .byteenable
		.CPU_jtag_debug_module_waitrequest       (mm_interconnect_0_cpu_jtag_debug_module_waitrequest),       //                                  .waitrequest
		.CPU_jtag_debug_module_debugaccess       (mm_interconnect_0_cpu_jtag_debug_module_debugaccess),       //                                  .debugaccess
		.JTAG_UART_avalon_jtag_slave_address     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //       JTAG_UART_avalon_jtag_slave.address
		.JTAG_UART_avalon_jtag_slave_write       (mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),       //                                  .write
		.JTAG_UART_avalon_jtag_slave_read        (mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),        //                                  .read
		.JTAG_UART_avalon_jtag_slave_readdata    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //                                  .readdata
		.JTAG_UART_avalon_jtag_slave_writedata   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //                                  .writedata
		.JTAG_UART_avalon_jtag_slave_waitrequest (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //                                  .waitrequest
		.JTAG_UART_avalon_jtag_slave_chipselect  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  //                                  .chipselect
		.SDRAM_s1_address                        (mm_interconnect_0_sdram_s1_address),                        //                          SDRAM_s1.address
		.SDRAM_s1_write                          (mm_interconnect_0_sdram_s1_write),                          //                                  .write
		.SDRAM_s1_read                           (mm_interconnect_0_sdram_s1_read),                           //                                  .read
		.SDRAM_s1_readdata                       (mm_interconnect_0_sdram_s1_readdata),                       //                                  .readdata
		.SDRAM_s1_writedata                      (mm_interconnect_0_sdram_s1_writedata),                      //                                  .writedata
		.SDRAM_s1_byteenable                     (mm_interconnect_0_sdram_s1_byteenable),                     //                                  .byteenable
		.SDRAM_s1_readdatavalid                  (mm_interconnect_0_sdram_s1_readdatavalid),                  //                                  .readdatavalid
		.SDRAM_s1_waitrequest                    (mm_interconnect_0_sdram_s1_waitrequest),                    //                                  .waitrequest
		.SDRAM_s1_chipselect                     (mm_interconnect_0_sdram_s1_chipselect),                     //                                  .chipselect
		.sysid_qsys_control_slave_address        (mm_interconnect_0_sysid_qsys_control_slave_address),        //          sysid_qsys_control_slave.address
		.sysid_qsys_control_slave_readdata       (mm_interconnect_0_sysid_qsys_control_slave_readdata),       //                                  .readdata
		.UART_s1_address                         (mm_interconnect_0_uart_s1_address),                         //                           UART_s1.address
		.UART_s1_write                           (mm_interconnect_0_uart_s1_write),                           //                                  .write
		.UART_s1_read                            (mm_interconnect_0_uart_s1_read),                            //                                  .read
		.UART_s1_readdata                        (mm_interconnect_0_uart_s1_readdata),                        //                                  .readdata
		.UART_s1_writedata                       (mm_interconnect_0_uart_s1_writedata),                       //                                  .writedata
		.UART_s1_begintransfer                   (mm_interconnect_0_uart_s1_begintransfer),                   //                                  .begintransfer
		.UART_s1_chipselect                      (mm_interconnect_0_uart_s1_chipselect)                       //                                  .chipselect
	);

	CPU_qsys_irq_mapper irq_mapper (
		.clk           (clk_clk),                        //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.receiver1_irq (irq_mapper_receiver1_irq),       // receiver1.irq
		.sender_irq    (cpu_d_irq_irq)                   //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (2),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                     // reset_in0.reset
		.reset_in1      (cpu_jtag_debug_module_reset_reset),  // reset_in1.reset
		.clk            (clk_clk),                            //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule
