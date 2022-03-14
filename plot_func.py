import matplotlib
import matplotlib.pyplot as plt

# Show plot with subplots and common parameters
def showplot(fig, axis, ls=1.5,fs=20):
    import matplotlib.pyplot as plt
    plt.rcParams.update({'font.size': fs})
    #### Get handles and print plot ####
    handles, labels = axis[0,0].get_legend_handles_labels()
    fig.legend(handles, labels, bbox_to_anchor=(ls, 0.6),frameon=False,prop={'size': fs})
    l = axis.shape
    for i in range(0,l[0]):
        for j in range(0,l[1]):
            axis[i,j].grid(b=True, which='major', color='#999999', linestyle='-', alpha=0.5)
            axis[i,j].minorticks_on()
            axis[i,j].grid(b=True, which='minor', color='#999999', linestyle='-', alpha=0.1)
            for tick in axis[i,j].get_xticklabels():
                tick.set_fontname("Open Sans")
            for tick in axis[i,j].get_yticklabels():
                tick.set_fontname("Open Sans")
    fig.tight_layout()
    plt.show()
    
# Show plot with subplots and common parameters
def showplottwo(fig, axis, ls=1.5, fs=20):
    import matplotlib.pyplot as plt
    plt.rcParams.update({'font.size': fs})
    #### Get handles and print plot ####
    handles, labels = axis[0].get_legend_handles_labels()
    fig.legend(handles, labels, bbox_to_anchor=(ls, 0.8),frameon=False,prop={'size': fs})
    l = axis.shape
    for i in range(0,l[0]):
        axis[i].grid(b=True, which='major', color='#999999', linestyle='-', alpha=0.5)
        axis[i].minorticks_on()
        axis[i].grid(b=True, which='minor', color='#999999', linestyle='-', alpha=0.1)
        for tick in axis[i].get_xticklabels():
            tick.set_fontname("Open Sans")
        for tick in axis[i].get_yticklabels():
            tick.set_fontname("Open Sans")
    fig.tight_layout()
    plt.show()

# Shows single plot
def showplotone(fig, axis, ls=1.5, fs=20):
    import matplotlib.pyplot as plt
    plt.rcParams.update({'font.size': fs})
    #### Get handles and print plot ####
    handles, labels = axis.get_legend_handles_labels()
    fig.legend(handles, labels, bbox_to_anchor=(ls, 0.8),frameon=False,prop={'size': fs})
    axis.grid(b=True, which='major', color='#999999', linestyle='-', alpha=0.5)
    axis.minorticks_on()
    axis.grid(b=True, which='minor', color='#999999', linestyle='-', alpha=0.1)
    for tick in axis.get_xticklabels():
        tick.set_fontname("Open Sans")
    for tick in axis.get_yticklabels():
        tick.set_fontname("Open Sans")
    fig.tight_layout()
    plt.show()